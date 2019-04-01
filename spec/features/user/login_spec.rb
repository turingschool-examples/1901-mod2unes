require 'rails_helper'

RSpec.describe 'login / logout workflow' do
  it 'allows us to log in with good credentials' do
    user = User.create!(email: 'mike@turing.io', password: 'password')

    visit root_path

    click_link 'Log in'

    fill_in 'username', with: user.email
    fill_in 'password', with: user.password

    click_button 'Log In'

    expect(current_path).to eq(user_path(user))

    expect(page).to have_content("Welcome, #{user.email}")
    expect(page).to have_content("Profile Page for #{user.email}")
  end

  describe 'sad path' do
    before :each do
      @user = User.create!(email: 'mike@turing.io', password: 'password')
    end

    it 'block login if given bad credentials' do
      visit login_path

      fill_in 'username', with: @user.email
      fill_in 'password', with: 'bad password'
    end

    it 'block login if given no credentials' do
      visit login_path
      # leave form empty
    end

    after :each do
      click_button 'Log In'

      expect(current_path).to eq(login_path)

      expect(page).to have_content("Your credentials are bad and you should feel bad")
    end
  end
end