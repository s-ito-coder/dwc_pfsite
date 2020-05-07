class ContactMailer < ApplicationMailer
	default from: 'hogehoge@example.com'

	# 出品物が購入された場合のメール送信メソッド
	def send_when_item_bought(user, item)
		# ユーザー情報、メールの内容を定義
	    @user = user
	    @item = item
	    mail(
    		subject: "【おもいで通販】出品した商品が購入されました。",
    		to: @item.email
    	) do |format|
    		format.text
    	end
	end
end