Rails.application.routes.draw do
  resources :products
  get 'simple_pages/about'

  get 'simple_pages/contact'

  root 'simple_pages#landing_page'
  #sets homepage for app

  get 'simple_pages/index'

  get 'simple_pages/idex'

  resources :orders, only: [:index, :show, :create, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
