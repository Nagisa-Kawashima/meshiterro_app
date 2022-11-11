Rails.application.routes.draw do
  # get 'users/show'
  # get 'users/edit'
  # # get 'postimages/new'
  # get 'postimages/index'
  # get 'postimages/show'
  devise_for :users
  # get 'homes/top'
  root to: "homes#top"
  resources :users, only: [:show, :edit, :update]
  resources :post_images, only: [:new, :create, :index, :show, :destroy] do
    resources :post_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
  get "/homes/about" => 'homes#about', as: "about"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
