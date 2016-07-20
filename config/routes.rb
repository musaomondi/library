Rails.application.routes.draw do
 
  resources :books_on_loans
   get 'password_resets/new'
  get 'password_resets/edit'

  root 'static_pages#home'
  get 'help' => 'static_pages#help'
  get 'about'=> 'static_pages#about'
  get 'contact' => 'static_pages#contact'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  get 'borrow' => 'books#borrow'
  post 'return' => 'books#return'
  resources :users
  resources :books
  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new, :create, :edit, :update]
  resources :loan_books, only: [:create, :destroy]
end
