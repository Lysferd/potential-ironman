Rails.application.routes.draw do
  
  resources :platforms

  root 'home#index'
  
  controller :home do
    get    'index'  => :index
    get    'admin'  => :admin
    get    'login'  => :index
    post   'login'  => :create
    delete 'logout' => :destroy
  end
  
  resources :users
  resources :clients
  resources :product_types
  resources :products
  resources :solutions
  resources :activities
  resources :commissionings
  
end
