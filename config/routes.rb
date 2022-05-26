Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # resources :movies do
    resources :bookmarks, only: [:new, :create, :destroy]
    resources :lists, only: [:index, :new, :show, :create]
  # end

end
