require 'spec_helper'

describe UsersController do

  before(:each) do
    @user = User.create(username: "JTR", password: "sucks")
  end

  context "sign up" do
    it "creates a new user with valid params" do
      expect{
        post :create, :user => {username: 'Laura', password: 'password'}
        }.to change(User, :count).by(1)
    end

    it "doesn't create a new user when params are invalid" do
      expect{
        post :create, :user => {username: 'poop'}
      }.to_not change(User, :count)
    end
  end
end