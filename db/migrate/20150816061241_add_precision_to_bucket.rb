class AddPrecisionToBucket < ActiveRecord::Migration
  def up
    change_column :buckets, :amount, :decimal, :precision => 8, :scale => 2
  end
  def down
    change_column :buckets, :amount, :decimal
  end
end
