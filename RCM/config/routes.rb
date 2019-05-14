Rails.application.routes.draw do
 

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks"}
  root 'static_pages#index'
  get 'static_pages/home'
  get 'static_pages/simple_character'
  get 'static_pages/profile'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
