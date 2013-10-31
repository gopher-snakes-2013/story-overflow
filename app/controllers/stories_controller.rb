class StoriesController < ApplicationController
  def index
    @stories = Story.all
    @story = Story.new
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
    Story.update(params[:id], params[:story])
    redirect_to root_path
  end

  def destroy
    Story.destroy(params[:id])
    redirect_to root_path

  end

end