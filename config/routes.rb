Rails.application.routes.draw do
  get 'welcome/index' # , to: 'welcome#index'
  
  # Todas as rotas para o crud
  resources :coins

  #get '/coins', to: 'coins#index'

  #root to: 'welcome#index'
  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
