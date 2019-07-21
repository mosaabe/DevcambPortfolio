Rails.application.routes.draw do
  resources :portfolios

  
  get 'about', to: 'pages#about'
  get 'contactus', to: 'pages#contact'

  resources :blogs
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'pages#home' #get 'pages/home' localhost will ditect to home page
end
