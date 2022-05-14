Rails.application.routes.draw do
  default_url_options :host => "localhost:3000"
  resources :friends
  resources :friend_requests

  resources :posts do 
    get '/comments/userinfo',to: 'comments#get_comments_userInfo_for_each_post'
  
    resources :comments do
    post '/reply', to: 'comments#create_comment_reply' 
    end

  end

  post '/users', to:'users#create'
  post '/users/sign_in', to: 'sessions#create'
  delete '/users/sign_out', to: 'sessions#destroy'
  get '/user_posts/:id', to: 'users#user_posts'
  patch '/edituser',to: 'users#user_edit'
  get '/addfriend',to: 'users#friends_index'
  get '/requests/:id',to: 'friend_requests#user_friendRequests'
  get '/usersfriend/:id',to: 'users#userfriend'

  get'/userfriend/info/:id',to: 'users#all_info_for_friend'

  delete '/removefriend/:id/:current_user',to: 'friends#remove_friend'
  patch '/block/:id/:current_user',to: 'friends#block'
  patch '/unblock/:id/:current_user',to: 'friends#unblock'
  devise_for :users,expect: [:update]

end
