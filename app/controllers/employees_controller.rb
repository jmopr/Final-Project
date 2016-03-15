require 'json'
class EmployeesController < ApplicationController
  before_filter :authorize
  def index
    @year = params[:date] && params[:date][:year] ? params[:date][:year] : 2016
    @employees = Employee.where(data_year: @year)
    @departments = Department.all.sort_by &:name
    # @employees = Employee.all(:conditions => { :salary => 75000 })
    # Employee.all(:conditions => { :salary => 75000..100000})
    response.headers['Access-Control-Allow-Origin'] = '*'
    respond_to do |format|
      format.html
      format.json {render json: JSON.pretty_generate(Employee.get_all_data.as_json), status: 200}
    end
  end

  def home
  end
end
