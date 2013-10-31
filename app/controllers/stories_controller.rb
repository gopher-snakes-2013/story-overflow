class StoriesController < ApplicationController
  def index
    @stories = Story.all
  end

  def show
     @story = Story.find(params[:id])
  end

  def create
    @story = Story.create(params[:story])
    redirect_to root_path
  end

  def new
    @story = Story.new
  end

  def edit
    @story = Story.find(params[:id])
  end

  def update
    @story = Story.find(params[:id])
    @story.update_attributes(params[:story])
    redirect_to story_path(params[:id])
  end

end