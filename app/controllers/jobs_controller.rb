class JobsController < ApplicationController
  # POST /jobs
  def create
    @job = Job.new(job_params)
    if @job.save
      render json: job, status: :created
    else
      render json: job.errors, status: :unprocessable_entity
    end
  end

  # GET /jobs/:id
  def show
    job = Job.find(params[:id])
    render json: job
  end

  #GET /jobs
  def index
    jobs = Jobs.all
    render json: jobs
  end

  private

  def job_params
    params.require(:job).permit(:url, :employer_name, :employer_description, :job_title, :job_description, :year_of_experience, :education_requirement, :industry, :base_salary, :employment_type_id)
  end
end
