Rails.application.routes.draw do
  root to: 'sales#index'
  
  resources :sales
  resources :destinations
  resources :agents
  resources :offices
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
