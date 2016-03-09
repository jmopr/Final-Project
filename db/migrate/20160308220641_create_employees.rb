class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :name
      t.decimal :salary
      t.string :gender
      t.integer :data_year

      t.timestamps null: false
    end
  end
end
