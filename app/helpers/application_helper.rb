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

	def title
		(content_for?(:title) ? content_for(:title) + ' - ' : '') + "Формат один, коллекционные принты"
	end

end
