ActiveAdmin.register Artist do
  attrs = %i(
    name
    about
    bio
  )

  permit_params :name, :about, :bio,
    images_attributes: [:id, :image, :image_cache, :_destroy]

  show do
    attributes_table_for artist do
      attrs.each { |a| row a }
      row 'images' do
        artist.images.each do |i|
          span { image_tag i.image.url(:preview) }
        end
      end
    end
  end

  form multipart: true do |f|
    f.inputs "General" do
      attrs.each { |a| f.input a }
      f.has_many :images, allow_destroy: true do |ff|
        ff.input :image_cache, :as => :hidden
        ff.input :image, as: :file, hint: ff.template.image_tag(ff.object.image_url(:preview))
      end
    end
    f.actions
  end
end
