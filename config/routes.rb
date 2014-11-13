Rails.application.routes.draw do
  
  root 'home#index'
  
  controller :home do
    get    'index'  => :index
    get    'admin'  => :admin
    get    'login'  => :index
    post   'login'  => :create
    delete 'logout' => :destroy
  end
  
  resources :users
  resources :platforms
  resources :manufacturers
  resources :solutions
  resources :commissionings
  
end
