class ItemsController < ApplicationController
  def index
    @items = Item.all
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @items }
      format.json { render :json => @items }
    end
  end

  def show
    @item = Item.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @item }
      format.json { render :json => @item }
    end
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      redirect_to @item
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])

    if @item.update(item_params)
      redirect_to @item
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def clear_traders
    @item = Item.find(params[:id])
    @item.traders.destroy_all
    redirect_to @item
  end

  def destroy
    @item = Item.find(params[:id])
    @item.traders.destroy_all
    @item.destroy

    redirect_to root_path, status: :see_other
  end

  private
    def item_params
      params.require(:item).permit(:name, :price)
    end
end
