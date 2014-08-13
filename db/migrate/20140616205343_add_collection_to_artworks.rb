class AddCollectionToArtworks < ActiveRecord::Migration
  def change
    add_reference :artworks, :collection, index: true
  end
end
