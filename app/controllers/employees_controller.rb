class EmployeesController < ApplicationController
  def index
    @year = params[:date] && params[:date][:year] ? params[:date][:year] : 2016
    @employees = Employee.where(data_year: @year)
    @departments = Department.all
  end
end
