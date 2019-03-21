require 'rails_helper'

RSpec.describe "As a visiter" do
  describe "I visit an artists show page" do
    it "I can add a new song" do
      artist = Artist.create(name: 'Talking Heads')

      visit artist_path(artist)

      click_link 'Add Song'

      expect(current_path).to eq(new_artist_song_path(artist))

      fill_in 'Title', with: 'This Must be the Place'
      fill_in 'Length', with: 345
      fill_in 'song[play_count]', with: 3

      click_button 'Create Song'

      new_song = Song.last

      expect(current_path).to eq(artist_path(artist))
      expect(new_song.artist).to eq(artist)
      expect(new_song.title).to eq('This Must be the Place')
    end
  end
end
