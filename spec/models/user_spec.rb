require 'spec_helper'

describe User do
  let(:valid_attributes) {
     { username:"Jenny", password: "password" }
  }
  let(:user) {User.create(valid_attributes)}

  it "can create a user with valid attributes" do
    expect{
      user
    }.to change(User, :count)
  end


  it "does not create a user without username and password" do
    expect{
      User.create()
    }.to_not change(User, :count)
  end

  it "only stores unique usernames" do
    expect{
      user
      new_user = User.create!(valid_attributes)
    }.to raise_error
  end

  it "has a secret password" do
    expect(user.password).to_not eql("password")
  end
end


