class Cart
  attr_reader :cart

  def initialize(cart)
    @cart = cart || Hash.new(0)
    @cart.default = 0
  end

  def total_count
    if @cart
      @cart.values.sum
    else
      0
    end
  end

  def add_song(song_id)
    @cart[song_id.to_s] += 1
  end

  def count_of(song_id)
    @cart[song_id.to_s]
  end
end
