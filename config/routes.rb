Rails.application.routes.draw do

  # static pages
  get '/contact' => 'static_pages#contact', as: 'contact'
  get '/projects' => 'static_pages#projects', as: 'projects'

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
