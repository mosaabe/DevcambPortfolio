Rails.application.routes.draw do  
  resources :portfolios, except: [:show]

# to: for controller action, as: to specify prefix to to be used for path and url
# the get to map a path to an action and view
  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'

  
  get 'about', to: 'pages#about'
  get 'contactus', to: 'pages#contact'


  resources :blogs do
  	member do
  		get :toggle_status
  	end
  end

  root to: 'pages#home' #get 'pages/home' localhost will ditect to home page

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
