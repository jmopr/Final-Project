class EmployeesController < ApplicationController
  def index
    @employees = Employee.all
    @department = Department.all
  end

  def home
  end
end
