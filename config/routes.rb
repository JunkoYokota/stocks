Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'}
  resources :stocks
  root to: 'stocks#top'
  # get 'users/sign_out', to: 'stocks#top'

 
  get 'confirm_stocks', to: 'stocks#confirm'
  get 'test', to: 'stocks#test'
  put 'update_all', to: 'stocks#update_all'
  delete 'delete_all', to: 'stocks#delete_all'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
