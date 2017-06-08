Rails.application.routes.draw do

  scope module: :user do
    root 'posts#index'

    resources :posts do
      resources :comments
    end

    resources :users do
      post 'validate', on: :collection
      post 'validate_email/:id', to: 'users#validate_email', on: :collection
    end

    get '/feed', :to => 'users#show'
  end

  scope module: :guest do
    get '/login', :to => 'login#login'
    get '/signup', :to => 'login#sign_up_form'
    post '/login/sign_up', :to => 'login#sign_up'
  end

  resource :session, controller: :session, only: [:create, :destroy]


  # post '/users/validate', to: 'users#validate'
  # get '/users/validate', to: 'users#validate'
  # match '/users/validate', to: 'users#validate', via: [:put, :patch]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
