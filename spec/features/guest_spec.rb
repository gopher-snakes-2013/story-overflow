require 'spec_helper'

feature 'Guest' do
  let(:valid_attributes) {
      { title:"New title!", description:"lots of content", image_url: "http://eofdreams.com/data_images/dreams/cat/cat-06.jpg" }
  }
  let(:user) {User.create(username: "me", email: "me@example.com", password: "test123!")}
  let(:story) {user.stories.create(valid_attributes)}

  context "on index page" do
    it "can click a topic to see its page" do
      story
      visit root_path
      click_link "New title!"
      expect(page).to have_content "#{story.description}"
    end
  end





end