Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'users#index'

  post 'users/:id/like/create', to: 'likes#create', as: 'like_form'
  post 'users/:id/comment/create', to: 'comments#create', as: 'comment_form'
  get 'users/:user_id/post/new', to: 'posts#new', as: 'user_post_new'
  post 'users/:user_id/post', to: 'posts#create', as: 'create_new_post'

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show] 
  end
end
