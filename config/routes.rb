Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "user/registrations"}
  resources :user_stocks,only: [:create,:destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  get '/my_portfolio' => 'users#my_portfolio'
  get '/search_stocks' => 'stocks#search'
  get '/my_friends' => 'users#my_friends'
end
