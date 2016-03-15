class EmployeesController < ApplicationController
  before_filter :authorize
  def index
    @year = params[:date] && params[:date][:year] ? params[:date][:year] : 2016
    @employees = Employee.where(data_year: @year)
    @departments = Department.all
  end

  def home
  end
end
