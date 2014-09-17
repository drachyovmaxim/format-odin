class Image < ActiveRecord::Base
  belongs_to :model_with_image, polymorphic: true
  mount_uploader :image, ImageUploader
end
