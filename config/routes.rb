Rails.application.routes.draw do
  resources :posts do
    resources :comments
  end

  resources :users do
    post 'validate', on: :collection
  end

  # resources :users

  # post '/users/validate', to: 'users#validate'
  # get '/users/validate', to: 'users#validate'
  # match '/users/validate', to: 'users#validate', via: [:put, :patch]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
