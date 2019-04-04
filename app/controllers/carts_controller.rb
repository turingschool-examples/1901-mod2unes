class CartsController < ApplicationController
  include ActionView::Helpers::TextHelper

  def create
    song = Song.find(params[:song_id])
    @cart.add_song(song.id)
    session[:cart] = @cart.cart
    flash[:notice] = "You have #{pluralize(@cart.count_of(song.id), 'copy')} of #{song.title} in your cart"
    redirect_to songs_path
  end
end
