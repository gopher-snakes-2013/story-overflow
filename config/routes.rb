StoryOverflow::Application.routes.draw do
  root :to => 'stories#index'

  resources :stories, :only => [:index, :show, :create, :new, :edit, :update]
end
