class OrdersController < ApplicationController
  include ApplicationHelper
  before_action :authenticate_user!

  def index
    # ログインユーザのカートアイテムを全部取得
    @orders = current_user.orders
  end

  def show
  end

  def create
    # orderテーブルの全てのカラム情報を取得
    # item = Item.find(params[:id])
    order = Order.new( order_item_params )
    # ユーザの関連付け
    order.user_id = current_user.id
    # 注文履歴の登録
    order.save
    # OrderDetailテーブルに購入商品の情報を追加する
    gets_purchasing_information( current_user.items ).each do | order_detail |
      # order_idの格納
      order_detail.order_id = order.id
      # OrderDetailテーブルに登録
      order_detail.save
    end
    # 購入情報入力画面へ遷移
    redirect_to item_path
  end

  def confirm
    @order = Order.new
  	@item = Item.find([:id])
  end

  private
  def order_item_params
    # 購入処理を進める商品の情報を取得
    params.require( :order ).permit( :postal_code, :ship_to, :consignee, :payment, :postage, :total_price )
  end


end
