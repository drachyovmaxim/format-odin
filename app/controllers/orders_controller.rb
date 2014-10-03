class OrdersController < ApplicationController
  respond_to :js
  def create
    @order = Order.new(order_params)
    if @order.save
      @order.notify_admin
      render js: "alert('Отлично!');$('.popup-close').trigger('click');"
    else
      render js: 'alert("Email - обязательно");'
    end
  end

  private

    def order_params
      params.require(:order).permit(:print_id, :email, :name, :address, :comment, :phone, :ip)
    end
end
