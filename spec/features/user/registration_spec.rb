require 'rails_helper'

RSpec.describe 'registration workflow' do
  it 'should succeed with valid information' do
    email = 'mike@turing.io'
    visit root_path

    click_link 'Sign Up to Be a User'

    expect(current_path).to eq(new_user_path)

    fill_in 'Email', with: email
    fill_in 'Password', with: 'password'

    click_button 'Create User'

    last_user = User.last
    expect(last_user.email).to eq(email)
    expect(page).to have_content("Welcome, #{email}")
  end

  describe 'sad path' do
    it 'should fail with invalid/no information' do
      visit new_user_path
      # leave form empty
      click_button 'Create User'

      expect(current_path).to eq(users_path)
      expect(page).to have_content("Email can't be blank")
      expect(page).to have_content("Password can't be blank")
    end
  end
end