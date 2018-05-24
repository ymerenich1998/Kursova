Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users

  root to: 'pages#index'
  get 'pages/test'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    resources :questions do
  	resources :answers
  	post :right
  end

end
