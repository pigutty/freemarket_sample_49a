Rails.application.routes.draw do
  devise_for :users
  root 'top#index' # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    resources :top, only: :index, defaults: { format: 'json' }
  end
  resources :users, only: [:index]
  resources :user_identifications, only: [:index]
  resources :products, only:[:show, :new, :edit] do
    resources :category
  end
end

