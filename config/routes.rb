Rails.application.routes.draw do
  # get 'pages/landing'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "pages#landing"

  resources :categories do
   
    delete :destroy, on: :member
  end
end
