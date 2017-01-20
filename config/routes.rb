Rails.application.routes.draw do
  root 'advertisement#index'
  resources :advertisement
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
