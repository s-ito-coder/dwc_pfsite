class ItemsController < ApplicationController
	def index
	end

	def show
	end

	def exhibition
		@item = Item.new(item_params)
		@item.id = current_user.id
	end

	def create
	    # カートに入れるアイテムの情報取得
	    cart_item = CartItem.new( cart_item_params )
	    # アイテムを入れたユーザの関連付け
	    cart_item.end_user_id = current_end_user.id
	    # カートへアイテム保存
	    cart_item.save
	    flash[:notice] = "カート内に商品が追加されました。"
	    # カート画面へ遷移
	    redirect_to users_path
	end

    private
    def book_params
        params.require(:book).permit(:title, :body)
    end

    def correct_user
      item = Item.find(params[:id])
      if item.user.id != current_user.id
         redirect_to items_path
      end
    end
end