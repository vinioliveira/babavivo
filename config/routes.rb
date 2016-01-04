Rails.application.routes.draw do
  devise_for :players

  resources :players

  root 'home#index'
end
