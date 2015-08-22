class AddBucketOrderIdToBucket < ActiveRecord::Migration
  def up
    add_column :buckets, :bucket_order_id, :integer
  end
  def end
    remove_column :buckets, :bucket_order_id
  end
end
