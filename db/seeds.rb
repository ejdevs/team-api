# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Student.create!(
#   first_name: "First",
#   last_name: "Last Name",
#   email: "test@person.com",
#   phone_number: 3526,
#   short_bio: "I'm a person",
#   linkedin_url: "https://www.linkedin.com/in/adam-folta/",
#   twitter_handle: "twitter",
#   personal_site_url: "site",
#   online_resume_url: "https://via.placeholder.com/150",
#   github_url: "afolta",
#   photo_url: "photo",
#   password: "password",
# )

# Skill.create!(
#   student_id: 1,
#   skill_name: "Ruby",
# )

# Experience.create!(
#   start_date: 20221201,
#   end_date: 20240101,
#   job_title: "CAD Technician",
#   details: "Created assembly drawings and CAD files for R&D Equipment",
#   company_name: "Company X",
#   student_id: 2,
# )

Education.create!(
  start_date: 20221201,
  end_date: 20240101,
  degree: "Bachelor's",
  details: "Learned all about everything",
  university_name: "Columbia",
  student_id: 1,
)

Capstone.create!(
  name: "My Capstone",
  description: "description of capstone",
  url: "google.com",
  screenshot: "screenshot goes here",
  student_id: 2,
)
