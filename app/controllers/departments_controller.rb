require 'json'
class DepartmentsController < ApplicationController
  before_action :get_params, only: [:show]
  before_action :authorize

  def show
    response.headers['Access-Control-Allow-Origin'] = '*'
    data = Department.get_all_data(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: JSON.pretty_generate(data.as_json), status: 200 }
    end
  end

  def index
    @year = params[:year] ? params[:year] : 2016
    @departments = Department.all
    @job_titles = JobTitle.all
    @total_budget = Department.get_budgets(@year)
  end

  private
    def get_params
      @year = params[:year] ? params[:year] : 2016
      @department = Department.find(params[:id])
      @job_titles = JobTitle.all
      @employees = Employee.where(department_id: @department.id,
                   data_year: @year)
      @budget = @employees.sum(:salary).to_f
      @top_ten = @employees.order(salary: :desc).limit(10)
      @top_ten_men = @employees.where(gender: :male).order(salary: :desc).limit(10)
      @top_ten_women = @employees.where(gender: :female).order(salary: :desc).limit(10)
    end
end
