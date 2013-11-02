StoryOverflow::Application.routes.draw do
  root :to => 'stories#index'
  resources :stories, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :comments, only: [:show]
  end
end