class ItemsController < ApplicationController
	def index
		@items = Item.all
	end

	def show
		# 閲覧する商品情報を取得
		@item = Item.find(params[:id])
		# コメント機能
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
	      @items = Item.all
	      render 'index'
	    end
	end

	def edit
		@item = Item.find(params[:id])
	end

	def destroy
	    @item = Item.find(params[:id])
	    @item.destroy
	  	flash[:notice] = "商品を取り下げました。"
	    redirect_to items_url
	end

    private
    def item_params
        params.require(:item).permit(:genre_id, :name, :introduction, :listed_price, :image, :image2, :image3)
    end

    def correct_user
      item = Item.find(params[:id])
      if item.user.id != current_user.id
         redirect_to items_path
      end
    end
end