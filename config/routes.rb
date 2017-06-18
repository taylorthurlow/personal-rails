Rails.application.routes.draw do

  resources :logins
  resources :posts

  # root & welcome
  root 'sessions#new'

  # sessions
  resources :sessions, only: [:new, :create]
  controller :sessions do
    get 'logout' => :destroy, as: 'logout'
  end

end
