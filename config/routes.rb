Rails.application.routes.draw do
  devise_for :users
  get 'articles/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: "articles#index"

  get 'articles', to: 'articles#index'
  get 'articles/create', to: 'articles#new'
  get 'articles/:id', to: 'articles#show'
  get 'articles/:id/edit', to: 'articles#edit'
  get 'articles', to: 'articles#create'
  patch 'articles/:id', to: 'articles#update', as: :article
  post 'articles', to: 'articles#create'
  delete 'articles:id', to: 'articles#destroy'

end
