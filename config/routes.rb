Rails.application.routes.draw do
  resources :weapons
  resources :character_fights
  resources :fights
  resources :characters
  root to: 'pages#index'
end
