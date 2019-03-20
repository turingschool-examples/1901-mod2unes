require 'rails_helper'

RSpec.describe 'song index page', type: :feature do
  it 'shows all songs' do
    artist = Artist.create(name: 'Artist 1')
    song_1 = artist.songs.create(title: 'Song 1', length: 200, play_count: 2)
    song_2 = artist.songs.create(title: 'Song 2', length: 300, play_count: 5)

    visit songs_path

    expect(page).to have_link(song_1.title)
    expect(page).to have_content("Play Count: #{song_1.play_count}")
    expect(page).to have_link(song_2.title)
    expect(page).to have_content("Play Count: #{song_2.play_count}")
  end
end
