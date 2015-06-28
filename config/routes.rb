Rails.application.routes.draw do
  root 'static_pages#index'
  get "/templates/:name", to: "templates#serve", constraints: { name: /[\/\w\.]+/ }

  scope '/api' do
    devise_for :users
    resources :cocktails, only: [:index, :show, :create, :update, :destroy]
    resources :ingredients, only: [:index]
    resources :bars, only: [:index, :show, :create] do
      get 'available_cocktails', on: :collection
    end

  end

end
