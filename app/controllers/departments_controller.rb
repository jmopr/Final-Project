require 'json'
class DepartmentsController < ApplicationController
  before_action :get_params, only: [:show]
  before_action :authorize

  def show
    response.headers['Access-Control-Allow-Origin'] = '*'
    data = Department.get_all_data(params[:department])

    respond_to do |format|
      format.html
      format.json { render json: JSON.pretty_generate(data.as_json), status: 200 }
    end
  end

  def index
    @departments = Department.all.sort_by &:name
    @job_titles = JobTitle.all.sort_by &:title
  end

  private
    def get_params
      @year = params[:year] ? params[:year] : 2016
      @department = Department.find(params[:department])
      @employees = Employee.where(department_id: @department.id,
                   data_year: @year)
    end
end
