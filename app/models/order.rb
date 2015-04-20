class Order < ActiveRecord::Base

  belongs_to :print
  validates_presence_of :print_id
  before_save :sanitize_inputs
  after_create :notify_admin

  private
    def notify_admin
      OrderMailer.to_admin(self).deliver
    end

    def sanitize_inputs
      [:email,:name,:address,:comment,:phone,:ip].each do |attr|
        if self.send(attr).present?
          sanitized = self.send(attr).gsub(/<|>/, '')
          self.send("#{attr}=", sanitized)
        end
      end
    end
end
