Riddler::Application.routes.draw do
  resources :cards

  resources :questions

  resources :games

  root :to => 'main_pages#index'
  get "main_pages/index"
  get "main_pages/about"

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

end
