Rails.application.routes.draw do
 

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks"}
  root 'static_pages#index'
  get 'static_pages/home'
  get 'static_pages/simple_character'
  get 'static_pages/profile'
  get 'static_pages/show_all_users'
  get '/static_pages/change_role/:id' => 'static_pages#change_role' ,:as => :change_role
  get '/static_pages/block_user/:id' => 'static_pages#block_user' ,:as => :block_user
  get '/static_pages/unblock_user/:id' => 'static_pages#unblock_user' ,:as => :unblock_user

  resources :characters
  resources :campaigns
  resources :messages
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
