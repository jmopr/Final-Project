require 'json'
class DepartmentsController < ApplicationController
  before_action :get_params, only: [:show]
  before_filter :authorize
  
  def show
    response.headers['Access-Control-Allow-Origin'] = '*'
    data = Department.get_all_data(params[:Department])

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
      @year = params[:date] && params[:date][:year] ? params[:date][:year] : 2016
      @department = Department.find(params[:Department])
      @employees = Employee.where(department_id: @department.id,
                   data_year: params[:date][:year])
    end
end
