require 'spec_helper'

feature 'Visitor browses the website' do
  let(:valid_attributes) {
     { username:"Jenny", password: "password" }
  }
  let(:user) {User.create(valid_attributes)}

  context "on navbar" do
    it "sees a link to sign up" do
      visit root_path
      expect(page).to have_content("Sign Up")
    end

    it "goes to sign up form when clicking sign up" do
      click_on "Sign Up"
      expect(page).to have_content("You're almost ready to share your story.")
    end
  end


end


