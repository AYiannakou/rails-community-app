Rails.application.routes.draw do
  get 'password_resets/new'
  get 'password_resets/edit'
  root 'static_pages#home'
  get 'users/index'
  get 'users/show'

  get 'static_pages/about', as: 'about'

  get 'sessions/new'

  get '/signup', to: 'users#new'
  get '/signup', to: 'user#create'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get 'search', to: 'search#index'

  resources :users
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: %i[new create edit update]
  resources :microposts,          only: %i[create destroy show]

  match '/micropost/:micropost_id/answers/new' => 'answers#new', via: :get
  match '/microposts/:micropost_id' => 'answers#create', via: :post

end
