Rails.application.routes.draw do
  get 'control_users/index'
  resources :meals
  resources :meal_categories
  resources :orders
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations'}
  
  root :to => "home#index"
  get '/pedidos', to: "home#pedidos", as:'pedidos'
  put '/additem', to: 'cart#additem', as: 'additem'
  put '/removeitem', to: 'cart#removeitem', as: 'removeitem'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
