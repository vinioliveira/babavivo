Rails.application.routes.draw do
  get 'game/index'

  devise_for :players

  resources :players
  resources :matches, only: [:index, :show]
  get 'standings/overall', to: 'standings#overall'
  get 'scores/:season/:round', to: 'scores#index'

  root 'home#index'
end
