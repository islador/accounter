class AddDistributionToBucketOrder < ActiveRecord::Migration
  def up
    add_column :bucket_orders, :distribution, :text, array: true, default: []
  end
  def down
    remove_column :bucket_orders, :distribution
  end
end
