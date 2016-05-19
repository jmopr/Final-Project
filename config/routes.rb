Rails.application.routes.draw do
  # get 'static_pages/home'
  # get 'static_pages/help'
  # get 'static_pages/about'
  # get 'static_pages/contact'

  root 'static_pages#home'
  get 'employees/index'
  get 'job_titles/show'
  get 'employees/home'

  # get 'employees/api'

  resources :departments do
    resources :job_titles
  end

  # get '/login' => 'sessions#new'
  # post '/login' => 'sessions#create'
  # get '/logout' => 'sessions#destroy'
  # get '/signup' => 'users#new'
  # post '/users' => 'users#create'

  get '/departments/:id/year/:year' => 'departments#show'
  get '/departments/:department_id/job_titles/:job_title_id/year/:year' => 'job_titles#show'
  # get 'user/token'
end

# Rails.application.routes.draw do
#   root                'static_pages#home'
#   get    'help'    => 'static_pages#help'
#   get    'about'   => 'static_pages#about'
#   get    'contact' => 'static_pages#contact'
#   get    'signup'  => 'users#new'
#   get    'login'   => 'sessions#new'
#   post   'login'   => 'sessions#create'
#   delete 'logout'  => 'sessions#destroy'
#   resources :users do
#     member do
#       get :following, :followers
#     end
#   end
#   resources :account_activations, only: [:edit]
#   resources :password_resets,     only: [:new, :create, :edit, :update]
#   resources :microposts,          only: [:create, :destroy]
#   resources :relationships,       only: [:create, :destroy]
# end
