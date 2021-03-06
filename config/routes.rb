TimeToDo::Application.routes.draw do

  resources :tasks do
    collection do
      post :sort
      get :recent_tasks
      get :early_tasks
      get :list
    end
    member do
      put :done
      put :undone
    end
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

