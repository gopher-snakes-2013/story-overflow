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
      render :text => render_to_string(:partial => 'story', :locals => {:local_story => @story})

      # [Look @ ajaxy.js]:
      # BIG PICTURE: The result of the above (an html in string form) gets passed to ajax.done as an 'argument' that we chose to call 'new_story'
      # Note: render_to_string, takes two arguments
      #   1) Which partial to send data to [Look @ _story.html.erb]
      #   2) A hash, that gets sent and can be accessed by the partial :)

      # Render EX: render :text => "zebra"  <-- `new_story = "zebra"`
      # Render EX: render :json => {:apple => "moose"} <-- `new_story = {:apple => "moose"}

    else
      render :index
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