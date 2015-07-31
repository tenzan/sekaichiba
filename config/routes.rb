Rails.application.routes.draw do
  namespace :admin do
    root 'application#index'
  end

  devise_for :users
  root 'items#index'

  resources :items do
    resources :comments
  end
end
