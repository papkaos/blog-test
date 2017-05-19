Rails.application.routes.draw do
  resources :posts do
    resources :comments
  end

  resources :users

  get '/users/unique/:email', to: 'users#unique'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
