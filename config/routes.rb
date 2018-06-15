Rails.application.routes.draw do
  resources :quaters
  resources :teams
  resources :features
  resources :initiatives
  resources :roadmaps
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
