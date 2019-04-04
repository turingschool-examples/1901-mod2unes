require 'rails_helper'

RSpec.describe "Add songs to cart" do
  describe "As a visitor" do
    it "I can add songs to a cart" do
      artist = Artist.create!(name: 'Journey')
      song = artist.songs.create!(title: "Don't Stop Believin'", play_count: 12, length: 234)

      visit songs_path

      expect(page).to have_content("Cart: 0")

      click_button 'Add Song'

      expect(page).to have_content("Cart: 1")
      expect(page).to have_content("You have 1 copy of #{song.title} in your cart")

      click_button 'Add Song'

      expect(page).to have_content("Cart: 2")
      expect(page).to have_content("You have 2 copies of #{song.title} in your cart")
    end
  end
end
