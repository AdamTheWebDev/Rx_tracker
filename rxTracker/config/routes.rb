Rails.application.routes.draw do
  # get 'rx_images/index'

  devise_for :users
  resources :prescriptions
  # resources :rximage
  root 'prescriptions#index'
end
