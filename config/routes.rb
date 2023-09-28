Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "pages#landing"

  resources :categories do
    resources :dealings, only: [:index], param: :category_name, as: :category_dealings
   
    delete :destroy, on: :member
  end

  
  resources :dealings do
   
    delete :destroy, on: :member
  end
end
