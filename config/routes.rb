Rails.application.routes.draw do

  # archive
  controller :posts do
    get '/posts/archive' => 'posts#archive', as: 'archive'
  end

  # sessions
  resources :sessions, only: [:new, :create]
  controller :sessions do
    get 'logout' => :destroy, as: 'logout'
  end

  resources :logins
  resources :posts

  # root & welcome
  root 'posts#index'

end
