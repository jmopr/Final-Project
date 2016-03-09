class JobTitlesController < ApplicationController
  def show
    @job_title = JobTitle.find(1)
  end

  def index
    @job_titles = JobTitle.all
  end
end
