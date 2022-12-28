class EducationsController < ApplicationController
  before_action :authenticate_student, except: [:index, :show]
  
  def index
    educations = Education.all.order(:id)
    render json: educations
  end

  def create
    education = Education.new(
      student_id: current_student.id,
      degree: params[:degree],
      start_date: params[:start_date],
      end_date: params[:end_date],
      details: params[:details],
      university_name: params[:university_name],
    )
    if education.save
      render json: education
    else
      render json: { errors: education.errors.full_messages }, status: :bad_request
    end
  end

  def show
    education = Education.find_by(id: params[:id])
    render json: education
  end

  def update
    education = Education.find_by(id: params[:id])
    education.degree = params[:degree] || education.degree
    education.details = params[:details] || education.details
    education.start_date = params[:start_date] ||  education.start_date 
    education.end_date = params[:end_date] || education.end_date
    if education.save
      render json: education
    else
      render json: { errors: education.errors.full_messages }, status: :bad_request
    end
  end

  def destroy
    education = Education.find_by(id: params[:id])
    education.destroy
    render json: { message: "Education record successfully destroyed!" }
  end
end


end
