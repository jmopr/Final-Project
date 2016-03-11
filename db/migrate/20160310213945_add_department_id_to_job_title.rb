class AddDepartmentIdToJobTitle < ActiveRecord::Migration
  def change
    add_reference :job_titles, :department, index: true, foreign_key: true
  end
end
