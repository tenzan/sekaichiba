Rails.application.routes.draw do
  namespace :admin do
    root 'application#index'

    resources :items, only: :destroy
  end

  devise_for :users
  root 'items#index'

  resources :items, only: [:index, :show, :edit, :update, :new, :create] do
    resources :comments
  end
end
