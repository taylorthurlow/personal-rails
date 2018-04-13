Rails.application.routes.draw do

  # static pages
  controller :static_pages do
    get 'portfolio'
  end

  # archive
  resources :posts
  controller :posts do
    get 'archive', as: 'archive'
    post 'posts/markdown'
  end

  # sessions
  resources :sessions, only: [:new, :create]
  controller :sessions do
    get 'destroy', as: 'logout'
  end

  resources :logins, except: [:show]

  # root
  root 'posts#index'
end
