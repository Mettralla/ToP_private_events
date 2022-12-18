Rails.application.routes.draw do
  root 'events#index'
  devise_for :users
  resources :events, only: %i[index new create]
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
end
