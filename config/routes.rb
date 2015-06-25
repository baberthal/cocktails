Rails.application.routes.draw do
  devise_for :users
  root 'static_pages#index'
  get "/templates/:name", to: "templates#serve", constraints: { name: /[\/\w\.]+/ }

  resources :cocktails, only: [:index, :show, :create, :update, :destroy]
  resources :ingredients, only: [:index]
  resources :bars, only: [:index, :show, :create]
end
