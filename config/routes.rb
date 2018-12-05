Rails.application.routes.draw do
  resources :orders
  devise_for :users, controllers: { sessions: 'users/sessions' }
  root :to => "home#index"

  put '/additem', to: 'cart#additem', as: 'additem'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
