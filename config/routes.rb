Rails.application.routes.draw do
  resources :likes
  resources :posts
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # resource :users, only: [:create, :update, :show, :index]
  post '/login', to: 'users#login'
  get 'auto_login', to: 'users#auto_login'
end
