Rails.application.routes.draw do
  devise_for :users
  
  authenticated :user do
    root 'customers#index', as: :authenticated_root
  end



  root "pages#home"
end
