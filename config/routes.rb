Rails.application.routes.draw do
  root to: 'cocktails#index'

  resources :cocktails, only: [:index, :show, :new, :create, :destroy] do
    resources :doses, only: [:new, :create]
    resources :reviews, only: %i[new create]
  end

  resources :doses, only: :destroy
end
