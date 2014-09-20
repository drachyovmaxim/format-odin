class OrderMailer < ActionMailer::Base
	layout 'mail'

  default from: "from@example.com"

  def new_order(order) # Blue Monday, hah
  	@order = order
  	mail(to: Settings.admin_email, subject: 'Format1: New Order')
  end
end
