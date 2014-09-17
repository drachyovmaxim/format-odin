class AddAboutToArtists < ActiveRecord::Migration
  def change
    add_column :artists, :about, :string
  end
end
