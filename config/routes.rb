Rails.application.routes.draw do
  # Defines the root path route ("/")
  root to: redirect("/todos")

  get 'todos/active', to: 'todos#index', as: 'active_todos', scope: 'active'
  get 'todos/completed', to: 'todos#index', as: 'completed_todos', scope: 'completed'

  resources :todos, except: [:new] do
    collection do
      patch :toggle, to: 'todos#toggle'
      delete :completed, to: 'todos#destroy_completed'
    end
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
end
