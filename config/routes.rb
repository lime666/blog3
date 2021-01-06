Rails.application.routes.draw do
  root 'posts#index'
  get 'login', to: 'sessions#new'
  get 'signup', to: 'authors#new'
  get 'logout', to: 'sessions#destroy'
  resources :authors, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]

  resources :posts do
    resources :comments do
      member do
        post :publish
      end
    end
  end
end
