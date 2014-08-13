class ChangeNameToTitleInArtworks < ActiveRecord::Migration
  def change
  	rename_column :artworks, :name, :title
  end
end
