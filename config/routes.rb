Rails.application.routes.draw do
  resources :help_sources
  get '/', to: 'help_sources#index'
  get 'hello_world', to: 'hello_world#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
