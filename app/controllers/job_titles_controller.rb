require 'json'
class JobTitlesController < ApplicationController
  before_action :authorize

  def show
    @job_title = JobTitle.find(params[:JobTitle])
    @employees = Employee.where(job_title: @job_title.id,
                                data_year: params[:date][:year])
    data = JobTitle.get_all_data(params[:JobTitle])
    response.headers['Access-Control-Allow-Origin'] = '*'
    # respond_to do |format|
    #   format.html
      # format.json {
        render json: JSON.pretty_generate(data.as_json)
        # , status: 200}
    # end
  end

  def index
    @job_titles = JobTitle.all.sort_by &:title
  end
end
