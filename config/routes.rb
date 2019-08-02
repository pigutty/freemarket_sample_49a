Rails.application.routes.draw do
  devise_for :users
  root 'top#index' # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    resources :top, only: :index, defaults: { format: 'json' }
  end

  resources :users, only: [:index] do
    resources :credit_cards, only:[:new,:create]
  end
  resources :signup, only: [:index]
  resources :phone_number_authorization, only:[:new,:create]
  resources :address_registration, only:[:new,:create]
  resources :mypage_card, only:[:index,:new]
  resources :user_identifications, only: [:index]
  resources :user_profile, only:[:new]
  resources :products, only:[:show, :new, :edit, :create] do
    collection do
      get 'buy'
    end
    resources :category
  end
end

