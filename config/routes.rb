Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'admin#home'
  namespace :api do
    namespace :v1 do
      post 'authenticate', to: 'authentication#authenticate'
      scope :users, controller: :users do
        get 'generate' => :generate_token, as: 'generate_token'
        get 'information' => :information, as: 'information'
      end
      resources :project, only: [:index, :create, :update, :destroy]
      resources :contact, only: [:index, :create, :update, :destroy]
    end
  end

end
