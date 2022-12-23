Rails.application.routes.draw do
  root 'events#index'
  devise_for :users
  resources :events, only: %i[index new create]
  resources :users
  resources :enrollments, only: %i[new create]
end
