Rails.application.routes.draw do
  root 'static_pages#home'
  get 'help' => 'static_pages#help'
  get 'about'=> 'static_pages#about'
  get 'contact' => 'static_pages#contact'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  get 'accept' => 'leases#accept'
  resources :users
  resources :books
  resources :leases
  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new, :create, :edit, :update]
end
