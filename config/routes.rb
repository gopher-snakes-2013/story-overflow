StoryOverflow::Application.routes.draw do
  root :to => 'stories#index'

  resources :stories, :only => [:index]
end
