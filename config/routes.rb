Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  namespace :users do
    resources :address, only: [:new, :create, :edit, :update]
  end
  devise_scope :user do
    get 'edit_profile', to: 'users/registrations#edit_profile', as: 'edit_profile'
    patch 'update_profile', to: 'users/registrations#update_profile', as: 'update_profile'
  end

  root to:"products#index"
  resources :products do
    collection do
      get 'select_child_category', default: { format: 'json' }
      get 'select_grandchild_category', default: { format: 'json' }
      get 'select_method', default: { format: 'json' }
    end
    member do
      get 'buy_confirmation'
      post 'buy_complete'
    end
  end
  resources :categories, only: [:index, :show]
  resources :users, only: [:show, :edit]
  resources :cards, only: [:index, :new, :create, :destroy]

end
