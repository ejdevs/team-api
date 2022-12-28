class StudentsController < ApplicationController
  def index
    students = Student.all
    render json: students.as_json
  end

  def show
    photo = Photo.find_by(id: params[:id])
    render json: photo.as_json
  end

  def create
    student = Student.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation],

    )
    if student.save
      render json: { message: "Student created successfully" }, status: :created
    else
      render json: { errors: student.errors.full_messages }, status: :bad_request
    end
  end
end
