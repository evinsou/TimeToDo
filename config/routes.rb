TimeToDo::Application.routes.draw do

  resources :tasks do
    post :sort, on: :collection
    get :recent_tasks, :on => :collection
    get :early_tasks, on: :collection
    get :list, on: :collection
#    put
  end
  resources :users
  resources :agile_labors, :except => :show
  resource :session

  match '/login' => "sessions#new", :as => "login"
  match '/logout' => "sessions#destroy", :as => "logout"

#  match '/recent_tasks'=> "tasks#recent_tasks"#, :as => "recent_tasks"
#  match '/early_tasks'=> "tasks#early_tasks"#, :as => "early_tasks"

#  match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
#  match 'tasks/:id' => "tasks#destroy", :as => :destroy
  #match '/delete' => "tasks#destroy"
  root :to => "tasks#index"
  match '/sort_tasks' => 'tasks#sort'
  match '*path', :to => "application#error_not_found"
end

