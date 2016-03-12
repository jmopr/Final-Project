class DepartmentsController < ApplicationController
  def show
    @year = params[:date] && params[:date][:year] ? params[:date][:year] : 2016
    @department = Department.find(params[:Department])
    @employees = Employee.where(department_id: @department.id,
                                data_year: params[:date][:year])
  end

  def index
    @departments = Department.all
    @job_titles = JobTitle.all
  end
end
