require 'spec_helper'

feature 'Guest' do
  let(:valid_attributes) {
      { title:"New title!", description:"lots of content", image_url: "http://eofdreams.com/data_images/dreams/cat/cat-06.jpg" }
  }
  let(:story) {Story.create(valid_attributes)}

  context "on index page" do
    it "can click a topic to see its page" do
      story
      visit root_path
      click_link "New title!"
      sleep(1)
      expect(page).to have_content "#{story.description}"

    end

  end





end