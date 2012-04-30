Rails3BootstrapDeviseCancan::Application.routes.draw do
  authenticated :user do
    root :to => 'home#index'
  end
  devise_for :users
  resources :users, :only => [:show, :index]

  namespace :api do
    devise_for :users
  end

  root :to => "home#index"
end
