Rails.application.routes.draw do

  resources :wikis
  resources :charges, only: [:new, :create]
  resources :collaborators, only: [:create, :destroy]

  post '/downgrade' => 'users#downgrade', as: :downgrade

  devise_for :views
  devise_for :users

  root 'welcome#index'
end
