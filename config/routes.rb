Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'lists#index'
  get "home", to: "pages#home"
  resources :lists, only: [:show, :index, :new, :create, :destroy] do
    resources :bookmarks, only: [:new, :create]
  end
  resources :bookmarks, only: [:destroy]
  resources :movies, only: [:index, :new, :create]
end
