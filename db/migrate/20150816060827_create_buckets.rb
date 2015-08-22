class CreateBuckets < ActiveRecord::Migration
  def change
    create_table :buckets do |t|
      t.decimal :amount
      t.string :name

      t.timestamps null: false
    end
  end
end
