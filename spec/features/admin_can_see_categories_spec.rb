require 'rails_helper'

RSpec.describe 'admin categories workflow' do
  context 'as an admin' do
    it 'allows admin to see song categories' do

      admin = User.create(email: 'admin@turing.io', password: 'password', role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_categories_path

      expect(page).to have_content('Admin Categories')
    end
  end

  context 'as anybody else' do
    it 'should fail for visitors' do
      visit admin_categories_path
    end

    it 'should fail for default users' do
      user = User.create(email: 'admin@turing.io', password: 'password', role: 0)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit admin_categories_path
    end

    after :each do
      expect(page).to_not have_content('Admin Categories')
      expect(page).to have_content("The page you were looking for doesn't exist (404)")
    end
  end
end