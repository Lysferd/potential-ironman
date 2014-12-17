Rails.application.routes.draw do

  # -=-=-=-=-
  # Standard HTTP requests.
  controller :home do
    get    'index'  => :index
    get    'admin'  => :admin #remove this
    get    'menu'   => :menu
    get    'login'  => :login
    post   'login'  => :create
    delete 'logout' => :destroy
  end
  
  # -=-=-=-=-
  # AJAX requests.
  # get 'commissioning_add_user' => 'commissionings#add_user'
  
  # -=-=-=-=-
  # Standard resources.
  resources :users do
    resources :certifications
  end

  resources :roles
  resources :commissionings
  resources :solutions
  resources :activities
  resources :manufacturers
  resources :products
  resources :platforms
  resources :clients
  resources :product_types
  
  root to: 'home#index'
end
