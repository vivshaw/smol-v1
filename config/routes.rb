Rails.application.routes.draw do
  resources :posts, except: :show

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  # Show user profile
  get '@:username' => 'users#show', as: :user_profile

  get '@:username/:id' => 'posts#show', as: :post_by_user

  # Homepage
  root 'posts#index'
end
