StoryOverflow::Application.routes.draw do
  root :to => 'stories#index'

  resources :stories, :only => [:index, :show, :create, :new]
  resources :users, :only => [:create, :new, :show]
  resources :sessions, :only => [:create]
end
