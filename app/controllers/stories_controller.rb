class StoriesController < ApplicationController
  def index
    @stories = Story.all
    @story = Story.new
  end

  def show
     @story = Story.find(params[:id])
  end

  def create
    @story = Story.new(params[:story])
    if @story.save
      render :text => render_to_string(:partial => 'story', :locals => {:story => @story})
    else
      redirect_to root_path
    end
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
    # render :text => render_to_string("#{params[:id]}")

    redirect_to root_path
  end

end