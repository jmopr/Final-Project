class AddYearToJobTitle < ActiveRecord::Migration
  def change
    add_column :job_titles, :data_year, :integer
  end
end
