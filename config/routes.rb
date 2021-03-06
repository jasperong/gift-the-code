Rails.application.routes.draw do

  devise_for :users, controllers: { registrations: 'users/registrations', passwords: 'users/passwords' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'creatives#index'
  get 'users/:id' => 'users#show'
  mount Thredded::Engine => '/forum'

end
