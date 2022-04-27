Rails.application.routes.draw do
  
  get 'homes/top'
  get 'books/index'
  get 'books' => 'books#index',as:'index_book'
  
  #routing追記
  
  get 'books/index' => 'books#new'
  post 'books' => 'books#create'
  get 'books/show/:id'=> 'books#show',as: 'book'
  get 'books/:id/edit' => 'books#edit',as: 'edit_book'
  patch 'books/:id' => 'books#update', as: 'update_book'
  delete 'books/:id' => 'books#destroy', as: 'destroy_book'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
