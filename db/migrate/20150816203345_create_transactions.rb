class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.decimal :amount
      t.integer :bucket_id
      t.integer :source_id
      t.string :source_type

      t.timestamps null: false
    end
  end
end
