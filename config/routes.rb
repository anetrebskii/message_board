Rails.application.routes.draw do
  root 'advertisements#index'
  resources :advertisements
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
