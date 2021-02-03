Iris::Application.routes.draw do

  resources :room_schedule_contacts do
      collection {post :import}
  end

  # Rewrite from old site
  match 'detail.php', :to => 'old_site_redirector#detail', via: :get
  match 'index.php', :to => 'old_site_redirector#pages', via: :get


  resources :classrooms do
    get :search, :on => :collection
    collection {post :import}
  end

  resources :locations
  resources :buildings, :has_one => :location

#Pages Routes
  match '/contact', :to => 'pages#contact', via: :get
  match '/about',   :to => 'pages#about', via: :get
  match '/about_iss',   :to => 'pages#about_iss', via: :get
  match '/help',    :to => 'pages#support', via: :get
  match '/support',    :to => 'pages#support', via: :get
  match '/privacy', :to => 'pages#privacy_policy', via: :get
  match '/iss_support',    :to => 'pages#iss_support', via: :get
  match '/signup',  :to => 'users#new', via: :get
  match '/development', :to => 'pages#development', via: :get
  match '/room', :to => 'pages#room', via: :get
  match '/faq', :to => 'pages#faq', via: :get
  match '/events', :to => 'pages#event_support', via: :get
  match '/admin', :to => 'pages#admin', via: :get

  root :to => "pages#home"
  devise_for :users
  resources :users

end
