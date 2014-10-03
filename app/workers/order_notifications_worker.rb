class OrderNotificationsWorker
  include Sidekiq::Worker

  def perform(order_id)
    order = Order.find(order_id)
    OrderMailer.to_admin(order).deliver
  end
end