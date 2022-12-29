# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Student.create!(
  first_name: "First",
  last_name: "Last Name",
  email: "test@person.com",
  phone_number: 3526,
  short_bio: "I'm a person",
  linkedin_url: "https://www.linkedin.com/in/adam-folta/",
  twitter_handle: "twitter",
  personal_site_url: "site",
  online_resume_url: "https://via.placeholder.com/150",
  github_url: "afolta",
  photo_url: "photo",
  password: "password",
)
