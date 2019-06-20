Rails.application.routes.draw do
 

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks"}
  root 'static_pages#index'
  get 'static_pages/home'
  get 'static_pages/simple_character'
  get 'static_pages/profile'
  get 'static_pages/show_all_users'
  get 'static_pages/show_all_campaigns'
  get '/static_pages/change_role/:id' => 'static_pages#change_role' ,:as => :change_role
  get '/static_pages/block_user/:id' => 'static_pages#block_user' ,:as => :block_user
  get '/static_pages/unblock_user/:id' => 'static_pages#unblock_user' ,:as => :unblock_user

  get 'users/:user_id/campaigns/:id/manage_characters' => 'campaigns#manage_characters', :as => :manage_characters
  post 'users/:user_id/campaigns/:id/add_character' => 'campaigns#add_character', :as => :add_character
  post 'users/:user_id/campaigns/:id/remove_character/:c' => 'campaigns#remove_character', :as => :remove_character
  post 'users/:user_id/campaigns/:id' => 'campaigns#inviter', :as => :inviter#
  post 'users/:user_id/invites/:id' => 'invites#accept', :as => :accept#
  #get '/static_pages/help' =>'campaigns#accept', :as => :accept#
  get '/callback', to: 'events#callback', as: 'callback'

	
  resources :events
	
  resources :users do
    resources :characters
    resources :campaigns
    resources :messages
    resources :invites

  end 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
