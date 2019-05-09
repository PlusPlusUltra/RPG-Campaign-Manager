Rails.application.routes.draw do
 

  devise_for :users
  root 'static_pages#index'
  get 'static_pages/home'
  get 'static_pages/simple_character'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
