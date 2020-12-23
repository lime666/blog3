Rails.application.routes.draw do
  resources :posts do
    resources :comments do
      member do
        post :publish
      end
    end
  end
  root 'posts#index'
end
