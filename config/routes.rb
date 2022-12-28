Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  post "/students" => "students#create"
  get "/students" => "students#index"
  get "/students/:id" => "students#show"
end
