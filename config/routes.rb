Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "static_pages#home"
  get "/about", to: "static_pages#about"
  get "/contact", to: "static_pages#contact"
  resources :users
  get "/register", to: "users#new"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  namespace :admin do
    get "/", to: "application#home"
    resources :users
  end
end
