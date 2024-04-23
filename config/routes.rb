Rails.application.routes.draw do
  get '/', to: 'residents#index'

  scope '(:locale)', locale: /#{I18n.available_locales.join("|")}/ do
    resources :addresses, except: [:destroy]
    resources :residents, except: [:destroy]
  end
end
