Rails.application.routes.draw do

  devise_for :users

  resources :recipes do
    resource :like, module: :recipes
    resources :comments, only: [:new, :create], module: :recipes
  end

  get '/tag/:tag', to: "recipes#tag"

  root to: "recipes#index"
end
