class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :image
      t.integer :model_with_image_id
      t.string :model_with_image_type
      t.timestamps
      t.index [:model_with_image_id, :model_with_image_type], name: "images_finder_index"
    end

    remove_column :artworks, :image
  end
end
