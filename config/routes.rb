Rails.application.routes.draw do
 
  # For Devise
  devise_for :users, controllers: { sessions: 'users/sessions' }

  resources :kanban_boards

  # * Card resources set up this way to get to sort function. From Supe Rails youtube
  resources :cards do
    member do
      put :sort
    end
    resources :comments
  end

  # * Column resources set up this way to get to sort function. From Supe Rails youtube
  resources :kanban_columns do
    member do
      put :sort
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  root to: 'kanban_boards#index'
end
