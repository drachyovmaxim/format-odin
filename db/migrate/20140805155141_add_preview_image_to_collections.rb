class AddPreviewImageToCollections < ActiveRecord::Migration
  def change
    add_column :collections, :preview_image, :string
  end
end
