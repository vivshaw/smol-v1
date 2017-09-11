Rails.application.routes.draw do
  resources :posts, except: :show do
    resources :comments
  end

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  # Show user profile
  get '@:username' => 'users#show', as: :user_profile

  # Get a post
  get '@:username/:id' => 'posts#show', as: :post_by_user

  # Fave and unfave
  match 'fave', to: 'faves#fave', via: :post
  match 'unfave', to: 'faves#unfave', via: :delete

  # Homepage
  root 'posts#index'
end
