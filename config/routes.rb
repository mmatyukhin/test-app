Rails.application.routes.draw do
  resources :customers
  get'/banned', to: 'customers#banned_index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
