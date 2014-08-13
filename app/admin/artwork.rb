ActiveAdmin.register Artwork do
  permit_params :title, :description, :year, :price, :artist_id, :image, :collection_id

  form multipart: true do |f|
    f.inputs "General" do
      f.input :title
      f.input :description
      f.input :year
      f.input :price
      f.input :artist
      f.input :collection
      f.input :image, as: :file, hint: f.template.image_tag(f.object.image.url) 
    end
    f.actions
  end
end
