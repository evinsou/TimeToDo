TimeToDo::Application.routes.draw do

  resources :tasks do
    post :sort, on: :collection
    get :recent_tasks, :on => :collection
    get :early_tasks, on: :collection
    get :list, on: :collection
  end
  resources :projects do
    resources :tasks, :controller => 'projects/tasks'
  end
  resources :agile_labors, :except => :show
  resource :session
  resources :users do
    resources :tasks
    resources :projects
  end
  match '/login' => "sessions#new", :as => "login"#, via: :get
  match '/logout' => "sessions#destroy", :as => "logout"#, via: :get

  root :to => "welcome#index"
  match '*path', :to => "application#error_not_found"
end

