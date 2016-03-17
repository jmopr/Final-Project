require 'json'
class JobTitlesController < ApplicationController
  before_action :authorize

  def show
    @year = params[:year]
    @job_title = JobTitle.find(params[:job_title_id])
    @employees = Employee.where(job_title_id: @job_title.id,
                                data_year: @year)
    
    data = JobTitle.get_all_data(@job_title.id)

    response.headers['Access-Control-Allow-Origin'] = '*'
    respond_to do |format|
      format.html
      format.json { render json: JSON.pretty_generate(data.as_json), status: 200 }
    end
  end

  def index
    @job_titles = JobTitle.all.sort_by &:title
  end
end
