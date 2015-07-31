class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      flash[:notice] = 'Item has been created.'
      redirect_to @item
    else
      flash.now[:alert] = 'Item has not been created.'
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update

    if @item.update(item_params)
      flash[:notice] = 'Item has been updated.'
      redirect_to @item
    else
      flash.now[:alert] = 'Item has not been updated.'
      render 'edit'
    end
  end

  def destroy

    if current_user.try(:admin?)
      @item.destroy
      flash[:notice] = 'Item has been deleted.'
    else
      flash[:alert] = 'Only admins can delete itesm.'
    end
    redirect_to items_url
  end

  private

  def set_item
    @item = Item.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = 'The item could not be found.'
    redirect_to items_path
  end

  def item_params
    params.require(:item).permit(:name, :quantity)
  end
end
