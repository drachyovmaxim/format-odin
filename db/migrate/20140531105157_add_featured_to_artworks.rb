class AddFeaturedToArtworks < ActiveRecord::Migration
  def change
    add_column :artworks, :featured, :boolean, default: false
  end
end
