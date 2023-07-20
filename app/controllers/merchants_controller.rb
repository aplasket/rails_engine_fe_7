class MerchantsController < ApplicationController
  def index
    @merchants = EngineFacade.new.merchants
  end

  def show
    @merchant = EngineFacade.new.merchant_by_id(params[:id])
    @items = EngineFacade.new.merchants_items(params[:id])
  end
end