class JobTitlesController < ApplicationController
  before_filter :authorize
  def show
    @job_title = JobTitle.find(params[:JobTitle])
    @employees = Employee.where(job_title: @job_title.id,
                                data_year: params[:date][:year])
  end

  def index
    @job_titles = JobTitle.all
  end
end
