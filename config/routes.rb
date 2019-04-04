Rails.application.routes.draw do
  resources :news, only: %i(new create index)
  resource :sessions, only: %i(new create destroy)
  root 'news#index'
 
end
