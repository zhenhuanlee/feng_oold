class Zhao::JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :update, :destroy]

  respond_to :html, :js

  def index
    @jobs = current_user_zhao.jobs.page params[:page]
    respond_with(@jobs)
  end

  def show
    respond_with(@job)
  end

  def new
    @job = Job.new
    respond_with(@job)
  end

  def edit
  end

  def create
    @job = current_user_zhao.jobs.build(job_params)
    @job.save
    respond_with(@job, location: zhao_jobs_path)
  end

  def update
    @job.update(job_params)
    respond_with(@job, location: zhao_jobs_path)
  end

  def destroy
    @job.destroy
    respond_with(@job, location: zhao_jobs_path)
  end

  private
    def set_job
      @job = current_user_zhao.jobs.find(params[:id])
    end

    def job_params
      params.require(:job).permit(:name, :gender, :age_min, :age_max, :salary_min, :salary_max,
                                  :salary_basic, :position_id, :company_id, :contact_id)
    end
end
