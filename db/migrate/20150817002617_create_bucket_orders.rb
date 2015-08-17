class CreateBucketOrders < ActiveRecord::Migration
  def change
    create_table :bucket_orders do |t|
      t.string :name
      t.integer :user_id
      t.text :bucket_order, array: true, default: []

      t.timestamps null: false
    end
  end
end
