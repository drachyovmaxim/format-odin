# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end


  version :large do
    process :resize_to_fit => [720, -1]
  end

  version :medium do
    process :resize_to_limit => [480, -1]
  end

  version :preview do
    process :resize_to_limit => [305, 260]
  end

end
