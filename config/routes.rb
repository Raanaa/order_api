Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users do
        collection do
          get 'user_order'
        end
      end
      resources :orders do 
        put 'accept_or_reject_order', to: 'orders#accept_or_reject_order'
      end
      resources :products
      post 'login', to: 'authentication#create'
      post 'register', to: 'users#create'
    end
  end
end