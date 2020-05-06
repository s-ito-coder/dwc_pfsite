class ContactMailer < ApplicationMailer
	# 出品物が購入された場合のメール送信メソッド
	def send_when_item_bought(user, contact)
		# ユーザー情報、メールの内容を定義
	    @user = user
	    @notice = contact.notice_text
	    mail to: user.email, subject: '【サイト名】 出品した商品が購入されました'
	end
end
