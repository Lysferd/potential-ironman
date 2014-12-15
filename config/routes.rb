Rails.application.routes.draw do
  
  root to: 'home#index'
  
  # -=-=-=-=-
  # Devise gem routes.
  devise_for :users, controllers: { registrations: 'users/registrations' }
  as :user do
    get 'login' => 'devise/sessions#new'
    post 'login' => 'devise/sessions#create'
    delete 'logout' => 'devise/sessions#destroy'
  end
  
  # -=-=-=-=-
  # Standard HTTP requests.
  get    'index'  => 'home#index'
  # get    'admin'  => 'home#index'
  
  # -=-=-=-=-
  # AJAX requests.
  # get 'commissioning_add_user' => 'commissionings#add_user'
  
  # -=-=-=-=-
  # Standard resources.
  resources :users
  resources :clients
  resources :product_types
  resources :products
  resources :solutions
  resources :activities
  resources :commissionings
  resources :manufacturers
  resources :certifications
  resources :roles
  resources :platforms
end
