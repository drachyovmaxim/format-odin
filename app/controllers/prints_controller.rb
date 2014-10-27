class PrintsController < ApplicationController
  def index
    @prints = Print.all
  end

  def exhibition
  end

  def show
    @print = Print.find params[:id]
  end
end