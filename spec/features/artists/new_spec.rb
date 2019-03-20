require 'rails_helper'

RSpec.describe 'new artist workflow' do
  context 'as a visitor' do
    it 'should create a new artist successfully' do
      artist_name = 'Journey'
      visit '/artists/new'
save_and_open_page
      fill_in 'artist[name]', with: artist_name

      click_button 'Create Artist'

      artist = Artist.last
      expect(current_path).to eq("/artists/#{artist.id}")
    end
  end
end
