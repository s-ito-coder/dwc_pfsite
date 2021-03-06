class ItemsController < ApplicationController
	include ApplicationHelper

	def index
		@items = Item.all
		# ransackを用いた検索機能
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
	    @item.address = current_user.address
	    @item.email = current_user.email
	    @item.postal_code = current_user.postal_code
	    # アイテムに出品者名を登録する
	    @item.ex_username = join_ex_username( current_user.last_name, current_user.first_name )
	    if @item.save
			flash[:notice] = "商品の出品が完了しました。"
	    	redirect_to @item
	    else
			flash[:notice] = "商品の出品に失敗しました。"
	    	@items = Item.all
			redirect_to items_path
	    end
	end

	def edit
		@item = Item.find(params[:id])
	end

	def boost
		@item = Item.find(params[:id])
	    @item.update( item_params )
	    flash[:notice] = "ブースト額を登録しました。"
		redirect_to action: 'show'
	end

	def buy
		@item = Item.find(params[:id])
		@user = User.find(current_user.id)
		exuser = @item.user
		# orderテーブルに格納する準備
		orders = Order.new
		flash[:notice] = "商品の購入処理が完了しました。"
		# orderテーブルに購入情報を格納
		orders.item_id = @item.id
		orders.item_name = @item.name
		orders.image_id = @item.image_id
		orders.user_id = current_user.id
		orders.postal_code = @user.postal_code
		orders.ship_to = @user.address
		orders.consignee = join_ex_username( @user.last_name, @user.first_name )
		# 処理時にブーストした金額と送料（一律800円）を上乗せする
		orders.total_price = @item.listed_price + @item.listed_price_boost + 800
		# 情報を保存
		orders.save
		if orders.save
		    # ContactMailer.send_when_item_bought( @user, @item ).deliver
			@item.selling_status = 1
			@item.ex_username = current_user.username
			@item.address = current_user.address
			@item.email = current_user.email
			@item.postal_code = current_user.postal_code
			@item.save
	    	redirect_to items_url
	    end
    end

    def finish
    	item = Item.find(params[:id])
    	item.selling_status = 2
    	if item.save
		  	flash[:notice] = "商品の出荷を通知しました。"
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
        params.require(:item).permit(:genre_id, :name, :introduction, :listed_price, :listed_price_boost, :image, :image2, :image3)
    end

    def correct_user
      item = Item.find(params[:id])
      if item.user.id != current_user.id
         redirect_to items_path
      end
    end
end