Rails.application.routes.draw do
  resources :students
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :students
  root "students#index"
end
