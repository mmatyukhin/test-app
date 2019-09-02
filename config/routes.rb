Rails.application.routes.draw do
  root 'customers#index'
  resources :customers
  get'/banned', to: 'customers#banned_index'
  get 'customers/:id/ban' => 'customers#ban'
  get 'customers/:id/unban' => 'customers#unban'
  post 'customers/ban_by_phone' => 'customers#ban_by_phone'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
