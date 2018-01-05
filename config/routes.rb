Rails.application.routes.draw do

  resources :wikis
  resources :charges, only: [:new, :create]

  post '/upgrade' => 'users#upgrade', as: :upgrade
  post '/downgrade' => 'votes#downgrade', as: :downgrade

  devise_for :views
  devise_for :users

  root 'welcome#index'
end
