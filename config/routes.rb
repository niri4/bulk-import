Rails.application.routes.draw do
  devise_for :users
  resources :policies
  resources :companies
  resources :employees
  root 'companies#index'
  namespace :admin do
    resources :employees, only: [:new, :create]
  end
  mount Sidekiq::Web => '/sidekiq'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
