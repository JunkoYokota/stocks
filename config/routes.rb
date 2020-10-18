Rails.application.routes.draw do
  devise_for :users
  resources :stocks
 
  get 'confirm_stocks', to: 'stocks#confirm'
  put :stocks, to: 'stocks#update_all'
  delete 'delete_all', to: 'stocks#delete_all'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
