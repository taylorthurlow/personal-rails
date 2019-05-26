Rails.application.routes.draw do

  # archive
  resources :posts
  controller :posts do
    get "archive", as: "archive"
    post "posts/markdown"
  end

  # sessions
  resources :sessions, only: [:new, :create]
  controller :sessions do
    get "destroy", as: "logout"
  end

  resources :projects, except: [:show]
  controller :projects do
    get "portfolio", action: :index
  end

  resources :logins, except: [:show]

  # root
  root "posts#index"
end
