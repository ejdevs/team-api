class SkillsController < ApplicationController
  
  before_action :authenticate_student, except: [:index, :show]
  
  def index
    skills = Skill.all.order(:id)
    render json: skills
  end

  def create
    skill = Skill.new(
      student_id: current_student.id,
      name: params[:name]
    )
    if skill.save
      render json: skill
    else
      render json: { errors: skill.errors.full_messages }, status: :bad_request
    end
  end

  def show
    skill = Skill.find_by(id: params[:id])
    render json: skill
  end

  def update
    skill = Skill.find_by(id: params[:id])
    skill.name = params[:name] || skill.name
    if skill.save
      render json: skill
    else
      render json: { errors: skill.errors.full_messages }, status: :bad_request
    end
  end

  def destroy
    skill = Skill.find_by(id: params[:id])
    skill.destroy
    render json: { message: "Skill successfully destroyed!" }
  end
end

end
