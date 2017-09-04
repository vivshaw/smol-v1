Rails.application.routes.draw do
  resources :posts
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  # Show user profile
  get '@:id' => 'users#show'

  # Homepage
  root 'posts#index'
end
