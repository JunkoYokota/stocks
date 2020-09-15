Rails.application.routes.draw do
  root      'stocks#index'
  get       'stocks'           =>  'stocks#index'
  get       'stocks/new'       =>  'stocks#new'
  get       'stocks/:id'       =>  'stocks#show'
  get       'stocks/:id/edit'  =>  'stocks#edit'
  patch     'stocks/:id'       =>  'stocks#update'
  post      'stocks'           =>  'stocks#create'
  delete    'stocks/:id'       =>  'stocks#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
