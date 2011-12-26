TimeToDo::Application.routes.draw do
  root :to => "tasks#index"
  resources :tasks do
    post :sort, on: :collection
  end
  resources :users
  resources :agile_labors, :except => :show
  resource :session

  match '/login' => "sessions#new", :as => "login"
  match '/logout' => "sessions#destroy", :as => "logout" 
  match '/recent_tasks'=> "tasks#recent_tasks"#, :as => "recent_tasks"
  match '/early_tasks'=> "tasks#early_tasks"#, :as => "early_tasks"
  match '/list' => 'tasks#list'
  match '/sort_tasks' => 'tasks#sort'
  match '*path', :to => "application#error_not_found"
end
