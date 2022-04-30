Rails.application.routes.draw do
  
  get 'homes/top'
  root to: 'homes#top'
  
  resources :books
  
  get 'books' => 'books#index',as:'index_book'
  get 'books' => 'books#new'
  delete 'books/:id' => 'books#destroy', as: 'destroy_book'
  patch 'books/:id' => 'books#update', as: 'update_book'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
