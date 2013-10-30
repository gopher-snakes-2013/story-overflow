require 'spec_helper'

describe StoriesController do
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
    let(:valid_attributes) {
      { title:"New title!", description:"lots of content", image_url: "http://eofdreams.com/data_images/dreams/cat/cat-06.jpg" }
    }
  let(:story) {Story.create(valid_attributes)}

    it "visits the show page" do
      get :show, id: story.id
      expect(response.status).to render_template("show")
    end
  end
end