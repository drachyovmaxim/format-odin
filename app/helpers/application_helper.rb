module ApplicationHelper
	def in_rubbles(price)
		number_to_currency(price, unit: "р.", format: "%n %u", precision: 0, delimiter: ' ')
	end

	def current_page
		params[:page] || 1
	end

  def kaleidoscope_img
    asset_path ["kalei/head.jpg", "kalei/heart.jpg", "kalei/chel.jpg", "kalei/chuvak.jpg"].sample
  end

	def meta_tags_for(o=nil)
    t = if o.nil?
      default_meta_tags
    elsif o.is_a?(Artist)
      meta_tags_for_artist(o)
    elsif o.is_a?(Print)
      meta_tags_for_print(o)
    end
    set_meta_tags(t)
	end

  def default_meta_tags
    title = "Формат один, коллекционные принты"
    description = "Творческое объединение «Формат один» работает с молодыми российскими художниками, преимущественно тесно связанными с граффити. Создавая произведения искусства галерейных форматов, доступные широкой аудитории, мы хотим не только познакомить с творчеством авторов, но и сделать его востребованным за пределами субкультуры."
    t = {
      title: title,
      open_graph: {
        title:       title,
        description: description,
        type:        'website',
      },
      twitter: {
        domain: 'format1.net',
        title: title,
        description: description
      }
    }
  end

  def meta_tags_for_print(p)
    image = ["http://format1.net", p.images.first.image.url(:large)].join
    description = strip_tags(p.description)
    t = {
      title: "#{p.title} | Автор: #{p.artist.name} - Формат один, коллекционные принты",
      description: description,
      open_graph: {
        title:       "#{p.title} - Формат один",
        description: description,
        type:        'website',
        image:       image,
        url:         print_url(p)
      },
      twitter: {
        card: 'summary_large_image',
        domain: 'format1.net',
        title: p.title,
        description: description,
        image: {
          src: image
        }
      }
    }
  end

  def meta_tags_for_artist(a)
    t = {
      title: "#{a.name} - Формат один, коллекционные принты",
      description: a.about,
      open_graph: {
        title:       a.name,
        description: a.about,
        type:        'website',
        url:         artist_url(a)
      },
      twitter: {
        domain: 'format1.net',
        title: a.name,
        description: a.about,
      }
    }
  end
end
