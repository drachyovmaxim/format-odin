class Collection < ActiveRecord::Base
	mount_uploader :image, ImageUploader
  mount_uploader :preview_image, ImageUploader

	validates_presence_of :title, :description

	has_many :artworks
end
