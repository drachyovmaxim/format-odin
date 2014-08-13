class OrdersController < ApplicationController
  def create
    order = Order.new params[:order].merge({ ip: request.remote_ip, created_at: Time.now })
    order.notify_admin
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js   { }
    end
  end
end
