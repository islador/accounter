class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.decimal :starting_amount
      t.decimal :current_amount
      t.string :name
      t.date :date_of_income
      t.string :source
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
