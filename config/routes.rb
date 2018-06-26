Rails.application.routes.draw do
  root 'home#index'
  get 'investments/new/:id', to: 'investments#new', as: 'new_investment'
  get 'investments/:id/edit', to: 'investments#edit', as: 'edit_investment'
  resources :investments
  resources :teams
  resources :features
  resources :initiatives
  resources :roadmaps
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
