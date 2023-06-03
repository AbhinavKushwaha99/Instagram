Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  authenticate :user,-> (u){u.admin?} do 
    mount ActiveAnalytics::Engine, at: "analytics"  # http://localhost:3000/analytics
  end


  get 'profiles/index'
  
  resources :likes , only: [:create, :destroy]
  resources :comments
  get 'users/show'
  
  devise_scope :user do 
    get '/users', to: 'devise/registrations#new'
    get '/users/password', to: 'devise/passwords#new'
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  resources :users,only: [:show]
  

  post 'users/:id/follow', to: "users#follow", as:"follow"
  post 'users/:id/unfollow', to: "users#unfollow", as:"unfollow"
  post 'users/:id/accept', to: "users#accept", as:"accept"
  post 'users/:id/decline', to: "users#decline", as: "decline"
  post 'users/:id/cancel', to: "users#cancel", as: "cancel"
  
  get 'home/about'
  get 'posts/myposts'
  get 'posts/discover'
  

  root "posts#index"
  resources :posts , :homes



  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
end
