class DepartmentsController < ApplicationController
  def show
    @department = Department.find(params[:Department])
    @employees = Employee.where(department_id: @department.id,
                                data_year: params[:date][:year])
  end

  def index
    @departments = Department.all
    @job_titles = JobTitle.all
  end
end
