require 'json'
class EmployeesController < ApplicationController
  before_action :get_params, only: [:index]
  # before_action :authorize

  def api
    render :json => Employee.all_employees(2016).to_json(:only => ["name", "salary", "gender"])
  end

  def index
    response.headers['Access-Control-Allow-Origin'] = '*'
    respond_to do |format|
      format.html
      format.json {render json: JSON.pretty_generate(Employee.get_all_data.as_json), status: 200}
    end
  end

  private
    def get_params
      @year = params[:year] ? params[:year] : 2016
      @employees = Employee.all_employees(@year)
      @departments = Department.all
      @job_titles = JobTitle.all
    end
end
