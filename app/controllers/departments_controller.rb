class DepartmentsController < ApplicationController
  def show
    @department = Department.find(1)
    # find(params[:id])
  end

  def index
    @departments = Department.all
    # where(id: params[:id])
  end
end
