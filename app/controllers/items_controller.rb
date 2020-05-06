class ItemsController < ApplicationController
	include ApplicationHelper

	def index
		@items = Item.all
		# 検索機能
		@search = Item.search(params[:q])
		@items = @search.result(distinct: true)
		respond_to do |format|
			format.html
			format.json { render json: @items }
		end
	end

	def show
		# 閲覧する商品情報を取得
		@item = Item.find(params[:id])
		# コメント機能
		@item_comment = ItemComment.new
	    @item_comments = @item.item_comments
	    # サインインしている場合オーダーを作成する
   		if user_signed_in? then
			@order = Order.new
		end
	end

	def exhibition
		@item = Item.new
	end

	def create
	    @item = Item.new(item_params)
	    @item.user_id = current_user.id
	    # アイテムに出品者名を登録する
	    @item.ex_username = join_ex_username( current_user.last_name, current_user.first_name )
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

	def buy
		@item = Item.find(params[:id])
		user = User.find(current_user.id)
		exuser = @item.user
		# orderテーブルに格納する準備
		orders = Order.new
		flash[:notice] = "商品の購入処理が完了しました。"
		@item.selling_status = false
		# orderテーブルに購入情報を格納
		orders.item_id = @item.id
		orders.item_name = @item.name
		orders.image_id = @item.image_id
		orders.user_id = current_user.id
		orders.postal_code = user.postal_code
		orders.ship_to = user.address
		orders.consignee = join_consignee( user.last_name, user.first_name )
		orders.total_price = @item.listed_price + 800
		# 情報を保存
		orders.save
		# 出品者に購入完了メールを送信する
		if orders.save
			@item.save
		    NotificationMailer.send_when_signup(@user).deliver
	    	redirect_to items_url
	    end
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