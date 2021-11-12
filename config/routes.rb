Rails.application.routes.draw do
  root 'pages#home'
  resources :lists, only: [:index, :show, :new, :create] do
    resources :bookmarks, only: [:new, :create]
  end
  resources :bookmarks, only: [:show, :destroy, :edit, :update]
  # resources :movies
end
