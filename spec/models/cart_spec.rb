require 'rails_helper'

RSpec.describe Cart do
  subject { Cart.new({"1" => 3,"2" => 2}) }

  describe '.total_count' do
    it "returns total songs in cart" do
      expect(subject.total_count).to eq(5)
    end
  end

  describe '.add_song()' do
    it 'add a song to the cart' do
      subject.add_song(1)
      subject.add_song(2)

      expect(subject.total_count).to eq(7)
    end
  end

  describe '.count_of()' do
    it 'count the songs by id' do
      expect(subject.count_of(1)).to eq(3)
      expect(subject.count_of(2)).to eq(2)
    end
  end
end
