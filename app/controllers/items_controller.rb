class ItemsController < ApplicationController
	def index
		@items = Item.all
	end

	def show
		@item = Item.find(params[:id])
		@item_comment = ItemComment.new
	    @item_comments = @item.item_comments
	end

	def exhibition
		@item = Item.new
	end

	def create
	    @item = Item.new(item_params)
	    @item.user_id = current_user.id
	    if @item.save
		  flash[:notice] = "商品の出品が完了しました。"
	      redirect_to @item
	    else
		  flash[:notice] = "商品の出品に失敗しました。"
	      @items = Book.all
	      render 'index'
	    end
	end

    private
    def item_params
        params.require(:item).permit(:genre_id, :name, :introduction, :listed_price, :image_id)
    end

    def correct_user
      item = Item.find(params[:id])
      if item.user.id != current_user.id
         redirect_to items_path
      end
    end
end