Rails.application.routes.draw do
  root 'home#index'
  get 'features/add/:id', to: 'features#new_connector', as: 'features/add'
  post '/connectors', to: 'features#connector_create'
  get 'features/investment/:id', to: 'features#investment', as: 'investment'
  patch '/connector', to: 'features#investment_update'
  resources :teams
  resources :features
  resources :initiatives
  resources :roadmaps
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
