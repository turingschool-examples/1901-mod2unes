class ArtistsController < ApplicationController
  def new
    @artist = Artist.new
  end

  def create
    artist = Artist.create(artist_params)
    redirect_to artist_path(artist)
  end

  def show
    @artist = Artist.find(params[:id])
  end

  private

  def artist_params
    params.require(:artist).permit(:name)
  end

end
