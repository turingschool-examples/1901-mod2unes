require 'rails_helper'

RSpec.describe 'new artist workflow' do
  context 'as a visitor' do
    it 'should create a new artist successfully' do
      artist_name = 'Journey'
      visit new_artist_path

      fill_in 'artist[name]', with: artist_name

      click_button 'Create Artist'

      artist = Artist.last
      expect(current_path).to eq(artist_path(artist))
    end
  end
end
