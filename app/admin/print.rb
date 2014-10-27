ActiveAdmin.register Print do
  attrs = %i(
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

  config.sort_order = 'position_asc'
  config.paginate   = false
  sortable

  index do
    id_column
    attrs.each { |a| column a }
    actions
    sortable_handle_column
  end

  show do |print|
    attributes_table_for print do
      attrs.each { |a| row a }
      row 'images' do
        print.images.each do |i|
          span { image_tag i.image.url(:preview) }
        end
      end
    end
  end

  form multipart: true do |f|
    f.inputs "General" do
      f.semantic_errors
      attrs.each { |a| f.input a }
      f.has_many :images, allow_destroy: true do |ff|
        ff.input :image_cache, :as => :hidden
        ff.input :image, as: :file, hint: ff.template.image_tag(ff.object.image_url(:preview))
      end
      f.semantic_errors :images
    end
    f.actions
  end
end
