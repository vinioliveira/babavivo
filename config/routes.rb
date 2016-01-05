Rails.application.routes.draw do
  devise_for :players

  resources :players
  get 'standings/overall', to: 'standings#overall'

  root 'home#index'
end
