class AddJobTitleToEmployee < ActiveRecord::Migration
  def change
    add_reference :employees, :job_title, index: true, foreign_key: true
  end
end
