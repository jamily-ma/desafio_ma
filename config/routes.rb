Rails.application.routes.draw do

  devise_for :users
  get 'home/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  get "up" => "rails/health#show", as: :rails_health_check

  root to: "home#index"

  scope module: 'users' do
    resources :user, only: [:new, :create] do
      member do
        edit
        update
        edit_password
        update_password
        end
    resources :posts do
      resources :conteudos
      end
    end
  end
end
