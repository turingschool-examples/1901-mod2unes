require 'rails_helper'

RSpec.describe Song, type: :model do
  describe 'Validations' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :length }
  end
  describe 'relationships' do
    it { should belong_to :artist }
    it { should have_many :playlist_songs }
    it { should have_many(:playlists).through :playlist_songs }
  end
end
