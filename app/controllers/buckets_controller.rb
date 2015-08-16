class BucketsController < ApplicationController
  before_action :authenticate_user!
  def index
    @buckets = current_user.buckets
  end

  def show
    @bucket = Bucket.find(params[:id])
    @transactions = @bucket.transactions
  end
end
