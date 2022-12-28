class CapstonesController < ApplicationController
  before_action :authenticate_student, except: [:index, :show]

  def index
    capstones = Capstone.all.order(:id)
    render json: capstones
  end

  def create
    capstone = Capstone.new(
      student_id: current_student.id,
      name: params[:name],
      description: params[:description],
      url: params[:url],
      screenshot: params[:screenshot],
    )
    if capstone.save
      render json: capstone
    else
      render json: { errors: capstone.errors.full_messages }, status: :bad_request
    end
  end

  def show
    capstone = Capstone.find_by(id: params[:id])
    render json: capstone
  end

  def update
    capstone = Capstone.find_by(id: params[:id])
    capstone.name = params[:name] || capstone.name
    capstone.description = params[:description] || capstone.description
    capstone.url = params[:url] || capstone.url
    capstone.screenshot = params[:screenshot] || capstone.screenshot
    if capstone.save
      render json: capstone
    else
      render json: { errors: capstone.errors.full_messages }, status: :bad_request
    end
  end

  def destroy
    capstone = Capstone.find_by(id: params[:id])
    capstone.destroy
    render json: { message: "Capstone successfully destroyed!" }
  end
end
