Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root 'top#index' # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    resources :top, only: :index, defaults: { format: 'json' }
    resources :products, only: [:edit,:create], defaults: {format: 'json'}
  end
  resources :top, only: :show
  resources :users, only: [:index,:edit,:show]
  resources :top, only: [:show]
  resources :users, only: [:index,:edit] do
    resources :mypage_card, only:[:index,:new]
  end
  resources :user_identifications, only: [:new,:create]
  resources :signup, only: [:index]
  resources :phone_number_authorization, only:[:new,:create]
  resources :address_registration, only:[:new,:create]
  resources :credit_cards, only:[:new,:create]
  resources :mypage_card, only:[:index,:new]
  resources :user_profile, only:[:new,:edit,:update]
  resources :products, only:[:show, :new, :edit, :create, :update, :destroy] do
    resources :purchases, only:[:new,:create]
    resources :comments, only: [:create]
    get :status, on: :member
    collection do
      get 'search'
    end
  end
  resources :registration_check, only: [:index]
end
