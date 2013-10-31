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
      visit root_path
      click_link "Sign Up"
      expect(page).to have_content("You're almost ready to share your story.")
    end

    it "can sign up and view profile page" do
      visit new_user_path
      expect {
        fill_in "Username", with: "octocat"
        fill_in "Password", with: "password123"
        click_button "Submit"
      }.to change{User.count}.by(1)#Need to make confirmation page

      page.should have_content 'You have successfully signed up.'
    end
  end
end

feature 'New user' do
  scenario 'signs up' do
    visit new_user_path
    fill_in "Username", with: "Pumpkin"
    fill_in "Password", with: "Butter"
    click_button "Submit"
    expect(session[:user_id]).to eq(User.find_by_username("Pumpkin").id)
  end
end