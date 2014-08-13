class AddBioInArtists < ActiveRecord::Migration
  def change
  	add_column :artists, :bio, :text
  end
end
