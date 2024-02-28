Rails.application.routes.draw do
  devise_for :users
  
  authenticated :user do
    root 'customers#index', as: :authenticated_root
  end

  resources :customers do
    resources :purchases
    resources :sales
  end

  resources :users do
    resources :warehouses 
  end

  resources :warehouses


  root "pages#home"
end
