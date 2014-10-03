class Order < ActiveRecord::Base

  belongs_to :print
  validates_presence_of :print_id, :email

  def notify_admin
    OrderNotificationsWorker.perform_async(self.id)
  end
end