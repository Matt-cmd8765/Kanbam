Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }  
  get 'kanban_board/index'
  get 'kanban_board/new'
  get 'kanban_board/create'
  resources :kanban_column do
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
  root to: 'kanban_board#index'
end
