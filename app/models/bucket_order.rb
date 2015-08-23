class BucketOrder < ActiveRecord::Base
  belongs_to :user
  has_many :buckets

  # Input may be any class with a 'distribute' method
  def distribute_to_buckets(input)
    buckets = Bucket.where(id: bucket_order)

    # This iteration doesn't allow for true duck typing.
    # The input's distribute method needs to handle the actual distribution.
    buckets.each do |bucket|
      distribution.each do |distribution|
        input.distribute(bucket, distribution)
      end
    end
  end
end
