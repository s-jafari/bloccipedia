Rails.application.routes.draw do
  devise_for :views
  devise_for :users
  get 'welcome/index'

  root 'welcome#index'
end
