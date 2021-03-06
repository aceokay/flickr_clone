Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'

  resources :home, only: :index

  resources :photos do
    resources :comments
  end

  resources :users

  resources :tags

end
