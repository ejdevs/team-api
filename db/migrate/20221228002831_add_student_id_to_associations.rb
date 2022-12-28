class AddStudentIdToAssociations < ActiveRecord::Migration[7.0]
  def change
    remove_column :experiences, :user_id, :integer
    add_column :experiences, :student_id, :integer
    add_column :educations, :student_id, :integer
    add_column :capstones, :student_id, :integer
    add_column :skills, :student_id, :integer
  end
end
