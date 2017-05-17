Rails.application.routes.draw do
  devise_for :users
  resources :prescriptions
  root 'prescriptions#index'
end
