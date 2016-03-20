Rails.application.routes.draw do
  root 'users#home'
  get 'employees/index'
  get 'job_titles/show'
  get 'employees/home'
  
  resources :departments do
    resources :job_titles
  end

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  get '/departments/:id/year/:year' => 'departments#show'
  get '/departments/:department_id/job_titles/:job_title_id/year/:year' => 'job_titles#show'
  get 'user/token'
end
