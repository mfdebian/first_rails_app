class TradersController < ApplicationController
  def create
    @item = Item.find(params[:item_id])
    @trader = @item.traders.create(trader_params)
    redirect_to item_path(@item)
  end

  private
    def trader_params
      params.require(:trader).permit(:name, :location, :role)
    end
end
