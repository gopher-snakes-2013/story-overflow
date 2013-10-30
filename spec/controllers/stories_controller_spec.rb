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
end