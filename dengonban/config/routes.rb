Rails.application.routes.draw do
  get 'dengonban/index'
  get 'dengonban', to: 'dengonban#index'
  post 'dengonban' , to:'dengonban#index'
  post 'dengonban/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
