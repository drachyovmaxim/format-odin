class ArtworksController < ApplicationController
  def index
    @artworks = Artwork.all
  end

  def exibition
  end

  def show
    @artwork = Artwork.find params[:id]
  end
end