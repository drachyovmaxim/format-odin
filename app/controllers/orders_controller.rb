class OrdersController < ApplicationController
  respond_to :js
  def create
    Order.create!(order_params)
    render js: "$('.popup-close').trigger('click');"
  end

  private

    def order_params
      params.require(:order).permit(:print_id, :email, :name, :address, :comment, :phone, :ip)
    end
end
