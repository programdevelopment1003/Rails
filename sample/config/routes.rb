Rails.application.routes.draw do
  get 'helo' , to: 'helo#index'
  get 'helo/other'

  post 'helo' , to: 'helo#index'
  post 'helo/index'
end
