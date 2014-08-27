class ArtworksController < ApplicationController
  def index
  	@artworks = Artwork.newest.page params[:page]
  end

  def show
  	# TODO: refactor this with scopes or any
  	@artwork      = Artwork.find params[:id]
  	@artist_works = @artwork.artist.artworks.where('id != ?', @artwork.id).limit(6)
  	@other_works  = Artwork.where('id NOT IN (?)', @artist_works.ids << @artwork.id).limit(9)
  end
end
