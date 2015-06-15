Rails.application.routes.draw do
  root 'static_pages#index'
  get "/templates/:name", to: "templates#serve", constraints: { name: /[\/\w\.]+/ }

  resources :cocktail_recipes, only: [:index]
end
