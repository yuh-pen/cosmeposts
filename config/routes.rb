Rails.application.routes.draw do

  root to: 'cosme_pictures#index'


  get 'cosme_pictures/index'

  get 'cosme_pictures/show'

  get 'cosme_pictures/new'

  get 'cosme_pictures/create'

  get 'cosme_pictures/edit'

  get 'cosme_pictures/destroy'

  get 'sessions/new'

  get 'sessions/create'

  get 'sessions/destroy'

 get 'signup',to:'users#new'
 resources :users, only:[:show,  :create, :edit, :destroy]
 
 resources :cosme_pictures, only:[:index, :show, :create, :edit, :destroy]
 
 get 'login', to:'sessions#new'
 post 'login', to:'sessions#create'
 delete 'logout', to:'sessions#destroy'
end
