class StudentsController < ApplicationController
  def index
    students = Student.all
    render json: students.as_json
  end

  def show
    student = student.find_by(id: params[:id])
    render json: student.as_json
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

  def update
    student = Student.find_by(id: params[:id])
    student.update(
      first_name: params[:name] || student.first_name,
      last_name: params[:last_name] || student.last_name,
      email: params[:email] || student.email,
      phone_number: params[:phone_number] || student.phone_number,
      short_bio: params[:short_bio] || student.short_bio,
      linkedin_url: params[:linkedin_url] || student,linkedin_url,
      twitter_handle: params[:twitter_handle] || student.twitter_handle,
      personal_site_url: params[:personal_site_url] || student.personal_site_url,
      online_resume_url: params[:online_resume_url] || student.online_resume_url,
      github_url: params[:github_url] || student.github_url,
      photo_url: params[:photo_url] || student.photo_url,
    )
    if student.save
    render json: student.as_json
  end
end

  def destroy
    id = params[:id]
    student = Student.find(:id)

    student.destroy
    render json: { message: "This student has been deleted." }
  end
end
