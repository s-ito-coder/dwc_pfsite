module OrdersHelper
    def gets_purchasing_information( item )
        # 合計金額を格納する変数
        @total_price = 0
        objects = item.map do | item |
            # 空のOrderDetailオブジェクトを作成
            order_detail = OrderDetail.new
            # item_idを取得
            order_detail.item_id = item.item_id
            # 購入価格を算出・取得
            order_detail.purchased_price = item.item.listed_price
            # 各商品の購入金額の加算処理
            @total_price += order_detail.purchased_price
            # order_id以外が入力されたOrderDetailオブジェクトを返す
            order_detail
        end
        # OrderDetailオブジェクト群に変換された変数を返す
        return objects
    end
end
