Rails.application.routes.draw do
  get 'posts/index'

  get 'home/top'

  get 'tasks/index'

  get 'tasks/show'

  root 'static_pages#top'
  get '/signup', to: 'users#new'
  
  get    '/login', to: 'sessions#new'
  post   '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  
  resources :users
  resources :tasks
end
