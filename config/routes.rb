Rails.application.routes.draw do
  root 'pages#home'
  resources :lists do
    resources :bookmarks, only: [:new, :create]
  end
  resources :bookmarks, only: [:show, :destroy, :edit, :update]
  # resources :movies
end
