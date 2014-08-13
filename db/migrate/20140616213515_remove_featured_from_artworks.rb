class RemoveFeaturedFromArtworks < ActiveRecord::Migration
  def change
  	remove_column :artworks, :featured
  end
end
