Rails.application.routes.draw do
  get 'messages/index'
  get 'messages/show'
  get 'messages/edit'
  get 'people/index'
  get 'people/find' ,to:'people#find'
  post 'people/find' , to:'people#find'
  get 'people' , to: 'people#index'
  get 'people/add', to:'people#add'
  post 'people/add', to: 'people#create'
  get 'people/:id', to: 'people#show'
  get 'people/edit/:id', to:'people#edit'
  #データの更新はpatchを使う(モデルインスタンがparams[:id]の時)
  patch 'people/edit/:id' ,to: 'people#updata'
  post  'people/edit/:id' ,to: 'people#updata'
  get '/people/deldata/:id' ,to:'people#delte'


  get 'messages' , to:'messages#index'

  get 'messages/add'
  post 'messages/add'

  get 'messages/add'
  post 'messages/add',to:'messages#create'

  get 'messages/edit/:id',to:'messages#edit'
  patch 'messages/edit/:id', to:'messages#update'

  get 'messages/delete/:id' ,to:'messages#delete'
  get 'messages/:id',to:'messages#show'



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
