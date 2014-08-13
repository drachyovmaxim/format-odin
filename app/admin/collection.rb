ActiveAdmin.register Collection do
  permit_params :title, :description, :image, :preview_image

  form multipart: true do |f|
    f.inputs "General" do
      f.input :title
      f.input :description
      f.input :image, as: :file, hint: f.template.image_tag(f.object.image.url) 
      f.input :preview_image, as: :file, hint: f.template.image_tag(f.object.preview_image.url) 
    end
    f.actions
  end
end
