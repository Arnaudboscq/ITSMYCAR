Rails.application.routes.draw do
  Rails.application.routes.default_url_options[:host] = 'localhost:3000'
  mount_devise_token_auth_for 'User', at: 'auth'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  resources :campaigns
  resources :drivers
  resources :candidacies
end
