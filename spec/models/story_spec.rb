require 'spec_helper'

describe Story do
  let(:valid_attributes) {
     { title:"New title!", description:"lots of content", image_url: "http://eofdreams.com/data_images/dreams/cat/cat-06.jpg" }
  }
  let(:story) {Story.create(valid_attributes)}


  it "has to have a title, description, and image_url" do
    expect{
      Story.create()
    }.to_not change(Story, :count)
  end

  it "only stores unique image_urls" do
    expect{
      story
      new_story = Story.create!(valid_attributes)
    }.to raise_error
  end

end



