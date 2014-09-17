class AddAboutToArtworks < ActiveRecord::Migration
  def change
    add_column :artworks, :about, :string
  end
end
