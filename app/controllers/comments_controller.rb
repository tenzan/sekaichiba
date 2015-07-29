class CommentsController < ApplicationController
  before_action :set_item
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  def new
    @comment = @item.comments.build
  end

  def create
    @comment = @item.comments.build(comment_params)

    if @comment.save
      flash[:notice] = 'Comment has been created.'
      redirect_to [@item, @comment]
    else
      flash.now[:alert] = 'Comment has not been created.'
      render 'new'
    end
  end

  def show
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def set_comment
    @comment = @item.comments.find(params[:id])
  end
end
