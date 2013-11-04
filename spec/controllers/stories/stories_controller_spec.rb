require 'spec_helper'

describe StoriesController do
  let(:valid_attributes) {
    { title:"New title!", description:"lots of content", image_url: "http://eofdreams.com/data_images/dreams/cat/cat-06.jpg" }
  }
  let(:story) {Story.create(valid_attributes)}

  describe "#new" do
    it  "brings up a page for creating a new story" do
      get :new
      expect(response.status).to render_template("new")
    end
  end

  describe "#create" do
    it "should create a topic with valid params" do
      expect {
        post :create, story: {title: 'Man bit by dog', description: 'Ouch that hurts', image_url: "http://maggiemcneill.files.wordpress.com/2012/01/dogs-biting-man.jpg" }
      }.to change {Story.count}.by(1)
      expect(Story.last.title).to eq('Man bit by dog')
    end
  end

  describe "#show" do

    it "visits the show page" do
      get :show, id: story.id
      expect(response.status).to render_template("show")
    end
  end

  describe "#edit" do
    it "visits the edit page and gets an edit form" do
      get :edit, :id => story.id
      expect(response).to render_template("edit")
    end
  end

  describe "#update" do
    it "updates the title of the given story with new data" do
      put :update, :id => story.id, story: { description: "not so much content" }
      expect(Story.find(story.id).description).to eq("not so much content")

      # story.title = "THIS IS A NEW TITLE"
      # expect(story.title).to eq("THIS IS A NEW TITLE")

    end
  end


end