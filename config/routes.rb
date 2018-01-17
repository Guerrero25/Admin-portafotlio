Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      post 'authenticate', to: 'authentication#authenticate'
      post 'generator', to: 'user#generate_token'
      resources :project, only: [:index, :create, :update, :destroy]
      resources :contact, only: [:index, :create, :update, :destroy]
    end
  end

end
