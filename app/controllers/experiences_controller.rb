class ExperiencesController < ApplicationController
  before_action :authenticate_student, except: [:index, :show]

  def index
    experiences = Experience.all.order(:id)
    render json: experiences
  end

  def create
    experience = Experience.new(
      student_id: current_student.id,
      job_title: params[:job_title],
      start_date: params[:start_date],
      end_date: params[:end_date],
      details: params[:details],
      company_name: params[:company_name],
    )
    if experience.save
      render json: experience
    else
      render json: { errors: experience.errors.full_messages }, status: :bad_request
    end
  end

  def show
    experience = Experience.find_by(id: params[:id])
    render json: experience
  end

  def update
    experience = Experience.find_by(id: params[:id])
    experience.job_title = params[:job_title] || experience.job_title
    experience.details = params[:details] || experience.details
    experience.company_name = params[:company_name] || experience.company_name
    experience.start_date = params[:start_date] || experience.start_date
    experience.end_date = params[:end_date] || experience.end_date
    if experience.save
      render json: experience
    else
      render json: { errors: experience.errors.full_messages }, status: :bad_request
    end
  end

  def destroy
    education = Experience.find_by(id: params[:id])
    education.destroy
    render json: { message: "Experience record successfully destroyed!" }
  end
end
