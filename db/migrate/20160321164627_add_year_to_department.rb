class AddYearToDepartment < ActiveRecord::Migration
  def change
    add_column :departments, :data_year, :integer
  end
end
