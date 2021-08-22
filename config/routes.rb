Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'homes#top'
  get "home/about" => "homes#about", as: :about
  get "users/:id" => "users#show", as: :mypage
  resources :users, only: [:index, :edit, :update]
  resources :books, only: [:new, :create, :index, :show, :destroy, :edit, :update]
end
