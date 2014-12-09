Rails.application.routes.draw do
  
  root to: 'home#admin'

  # -=-=-=-=-
  # Devise gem routes.
  devise_for :users
  as :user do
    #root to: 'devise/sessions#new'
    get 'login' => 'devise/sessions#new'
    post 'login' => 'devise/sessions#create'
    delete 'logout' => 'devise/sessions#destroy'
  end

  # -=-=-=-=-
  # Standard HTTP requests.
  get    'index'  => 'home#index'
  get    'admin'  => 'home#index'

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
  resources :permissions
  resources :platforms
end
