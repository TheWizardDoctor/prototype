Rails.application.routes.draw do
  resources :users
  get 'login/new'
  root 'home#index'
  get 'investments/new/:id', to: 'investments#new', as: 'new_investment'
  get 'investments/:id/edit', to: 'investments#edit', as: 'edit_investment'
  get '/login', to: 'login#new'
  post '/login', to: 'login#create'
  delete '/logout', to: 'login#destroy'
  resources :investments
  resources :teams
  resources :features
  resources :initiatives
  resources :roadmaps
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
