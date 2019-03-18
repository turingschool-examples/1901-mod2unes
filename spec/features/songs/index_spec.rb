require 'rails_helper'

RSpec.describe 'song index page', type: :feature do
  it 'shows all songs' do
    song_1 = Song.create(title: 'Song 1', length: 200, play_count: 2)
    song_2 = Song.create(title: 'Song 2', length: 300, play_count: 5)

    visit '/songs'

    expect(page).to have_content(song_1.title)
    expect(page).to have_content("Play Count: #{song_1.play_count}")
    expect(page).to have_content(song_2.title)
    expect(page).to have_content("Play Count: #{song_2.play_count}")
  end
end