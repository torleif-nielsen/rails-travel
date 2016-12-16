Rails.application.routes.draw do
  root to: 'sales#index'
  
  resources :sales
  resources :destinations
  resources :agents
  resources :offices
end
