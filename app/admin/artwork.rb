ActiveAdmin.register Artwork do
  ATTRS = %i(
    title
    about
    description
    year
    price
    artist
    collection
  )

  permit_params :title, :about, :description, :year, :price, :artist_id, :collection_id,
    images_attributes: [:id, :image, :image_cache, :_destroy]

  show do
    attributes_table_for artwork do
      ATTRS.each { |a| row a }
      row 'images' do
        artwork.images.each do |i|
          span { image_tag i.image.url(:preview) }
        end
      end
    end
  end

  form multipart: true do |f|
    f.inputs "General" do
      f.semantic_errors
      ATTRS.each { |a| f.input a }
      f.has_many :images, allow_destroy: true do |ff|
        ff.input :image_cache, :as => :hidden
        ff.input :image, as: :file, hint: ff.template.image_tag(ff.object.image_url(:preview))
      end
      f.semantic_errors :images
    end
    f.actions
  end
end
