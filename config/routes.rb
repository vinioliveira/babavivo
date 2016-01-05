Rails.application.routes.draw do
  devise_for :players

  resources :players
  get 'standings/overall', to: 'standings#overall'
  get 'scores/:season/:week', to: 'scores#index'

  root 'home#index'
end
