Rails.application.routes.draw do
  root 'events#index'
  devise_for :users
  resources :users, only: %i[show]
  resources :events
  resources :enrollments, only: %i[new create]
end
