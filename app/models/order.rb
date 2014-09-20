class Order
  include ActiveModel::Model
  extend ActiveModel::Naming

  attr_accessor :print, :email, :name, :address, :comment, :phone, :ip, :created_at
  validates_presence_of :print, :email

  def notify_admin
    OrderMailer.new_order(self).deliver
  end

  def print_id=(id)
    @print = Print.find id
  end

  def persisted?
    false
  end
end