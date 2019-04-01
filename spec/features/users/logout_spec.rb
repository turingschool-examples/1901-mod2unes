require 'rails_helper'

describe "user show page" do
  it "should have a button to log out a user" do
    user = User.create(username: "brian", password: "brian")

    visit root_path

    click_on "I already have an account"

    fill_in "username", with: user.username
    fill_in "password", with: user.password

    click_on "Log In"

    click_on "Log Out"

    expect(current_path).to eq(root_path)

    visit user_path(user)

    expect(page).to_not have_content(user.username)
  end
end
