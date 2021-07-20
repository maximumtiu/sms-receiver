Rails.application.routes.draw do
  resources :phone_numbers
  devise_for :users
  root 'static#home'
  get 'twilio', to: 'webhook#twilio'
end
