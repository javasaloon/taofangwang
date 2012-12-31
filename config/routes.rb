Taofangwang::Application.routes.draw do
  resources :communities


  resources :merits


  resources :needs


  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
  resources :users
end