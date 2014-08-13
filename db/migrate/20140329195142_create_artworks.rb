class CreateArtworks < ActiveRecord::Migration
  def change
    create_table :artworks do |t|
      t.string :name
      t.text :description
      t.integer :year
      t.integer :price
      t.references :artist

      t.timestamps
    end
  end
end
