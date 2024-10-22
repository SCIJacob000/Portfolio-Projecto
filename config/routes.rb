Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  
  root "students#index"

  resources :students do
    collection do
      get 'search', action: :index
    end
  end
  
end
