Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'}
  resources :stocks do
    collection do
      get '/:id/consumed_edit' => 'stocks#consumed'
      put '/:id/consumed_update' => 'stocks#consumed_update'
    end
  end
  root to: 'stocks#top'
  get 'top', to: 'stocks#top'

  get 'confirm_stocks', to: 'stocks#confirm'
  get 'confirm_update', to: 'stocks#confirm_update'
  put 'update_all', to: 'stocks#update_all'
  delete 'delete_all', to: 'stocks#delete_all'
  
  get 'index_near', to: 'stocks#near'
  get 'index_expire', to: 'stocks#expire'
  get 'index_past', to: 'stocks#past'
  get 'index_favorites', to: 'stocks#favorites'
  get 'index_tags', to: 'stocks#tags'


  get "stock_list/:per" => "stocks#stocks_page"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
