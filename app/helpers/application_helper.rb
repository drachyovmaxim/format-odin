module ApplicationHelper
	def in_rubbles(price)
		number_to_currency(price, unit: "руб.", format: "%n %u", precision: 0, delimiter: ' ')
	end

	def current_page
		params[:page] || 1
	end

  def kaleidoscope_img
    asset_path ["bb.jpg", "aa.jpg", "kale.png"].sample
  end

	def title
		(content_for?(:title) ? content_for(:title) + ' - ' : '') + "Формат один"
	end
end
