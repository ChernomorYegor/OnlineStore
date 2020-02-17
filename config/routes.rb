Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
	root 'items#index'
  
  devise_for :users
  resources :items
  resources :carts
  resources :line_items
  post 'line_items/:id/add' => "line_items#add_quantity", as: "line_item_add"
	post 'line_items/:id/reduce' => "line_items#reduce_quantity", as: "line_item_reduce"
	# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
