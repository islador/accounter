class BucketsController < ApplicationController
  before_action :authenticate_user!
  def index
    @buckets = current_user.buckets
  end

  def show
    @bucket = Bucket.find(params[:id])
    @transactions = @bucket.transactions
  end

  def new
    @bucket = Bucket.new
  end

  def create
    @bucket = current_user.buckets.create(permitted_bucket_params)
    redirect_to bucket_path(@bucket)
  end

  private
    def permitted_bucket_params
      params.require(:bucket).permit(:name)
    end
end
