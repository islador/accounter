class AddUserIdToBuckets < ActiveRecord::Migration
  def up
    add_column :buckets, :user_id, :integer
  end
  def down
    remove_column :buckets, :user_id
  end
end
