TimeToDo::Application.routes.draw do

  get "welcome/index"

  resources :tasks do
    collection do
      post :sort
      get :recent_tasks
      get :early_tasks
      get :list
    end
    member do
      #put :sort
      put :done
      put :undone
    end
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
  root :to => "welcome#index"
  match '/sort_tasks' => 'tasks#sort'
  match '*path', :to => "application#error_not_found"
end

