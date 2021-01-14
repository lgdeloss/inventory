Rails.application.routes.draw do
  root 'pages#home'
  get 'about', to: 'pages#about'
  resources :items
  get 'signup', to: 'users#new'
  resources 'users', except: [:new]
end
