Rails.application.routes.draw do
  get 'game/index'

  devise_for :players

  resources :players
  get 'standings/overall', to: 'standings#overall'
  get 'scores/:season/:week', to: 'scores#index'
  get 'match', to: 'match#index'

  root 'home#index'
end
