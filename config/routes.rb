Rails.application.routes.draw do
  devise_for :users
  root 'top#index' # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:index]
  resources :signup, only: [:index]
  resources :products, only:[:show, :new] do
    resources :category
  end
end
