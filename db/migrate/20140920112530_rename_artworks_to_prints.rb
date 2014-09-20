class RenameArtworksToPrints < ActiveRecord::Migration
  def change
    rename_table :artworks, :prints
  end
end
