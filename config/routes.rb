Rails.application.routes.draw do
  
  root to: 'static_pages#index'

  get 'sobre', to: 'static_pages#sobre'
  get 'contato', to: 'static_pages#contato'

  get 'entrar', to: 'session#new'
  post 'entrar', to: 'session#create'
  delete 'sair', to: 'session#destroy'

  delete 'excluir', to: 'users#destroy'

  get 'votar', to: 'candidates#new'
  post 'azul', to: 'candidates#azul'
  post 'vermelho', to: 'candidates#vermelho'
  post 'amarelo', to: 'candidates#amarelo'
  get 'resultado', to: 'candidates#result'

  resources :users
  resources :session
  resources :candidates

end
