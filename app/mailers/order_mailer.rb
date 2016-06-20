class OrderMailer < ActionMailer::Base
  layout 'mail'

  default from: "from@example.com"

  def to_admin(order)
    @order = order
    mail(to: Settings.admin_email, subject: 'Format1: Новый заказ')
  end
end
