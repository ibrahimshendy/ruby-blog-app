Rails.application.routes.draw do
  root 'home#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  # get "up" => "rails/health#article", as: :rails_health_check

  # Defines the root path route ("/")

  # Specify custom routes
  # get "articles", to: "articles#index"
  # get "articles/:id", to: "articles#article"

  resources :articles do
    resources :comments, only: [:create]
  end

  resources :contacts, only: [:new, :create]

end
