Rails.application.routes.draw do
	get 'welcome/index'
	resources :items
	root 'welcome#index'
	get 'items/purchase', to: 'items#purchase'
	get 'items/withInventory', to:'items#withInventory'
	get 'items/next', to: 'items#next'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
