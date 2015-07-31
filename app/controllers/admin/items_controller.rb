class Admin::ItemsController < Admin::ApplicationController

  def destroy
    @item = Item.find(params[:id])
    @item.destroy

    flash[:notice] = 'Item has been deleted.'
    redirect_to items_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :quantity)
  end

end
