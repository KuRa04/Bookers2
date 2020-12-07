Rails.application.routes.draw do

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
root 'homes#index'
get "home/about" => "homes#about",as:'about'
get 'users' => 'users#index'

resources :books, only: [:new, :create, :index, :show, :edit, :update, :destroy] 

resources :users, only:[:index, :show, :edit, :update, :create, :new]
end

