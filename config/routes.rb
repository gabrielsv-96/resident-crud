Rails.application.routes.draw do
  get '/', to: 'residents#index'

  resources :addresses, except: [:destroy]
  resources :residents, except: [:destroy]
end
