class UsersController < ApplicationController
    before_action :authenticate_user!

	def show
		@user = User.find(params[:id])
		@orders = @user.orders
		@items = @user.items
	end

	def edit
	end

	def update
		#ログインユーザ情報取得
	    user = User.find( current_user.id )
	    #ユーザ情報更新
	    user.update( user_params )
	    flash[:notice] = "ユーザー更新が正常に完了しました。"

	    #Withoutページからユーザが退会状態に変化した場合の処理
	    if user.is_deleted then
		    #logger.debug 'ログアウト処理実行'
		    #ログアウト処理
		    sign_out user
		    flash[:notice] = "退会処理が正常に完了しました。"
		    redirect_to root_path
		else
	    	#（退会していない場合）ログインユーザ詳細画面へ遷移
	    	redirect_to user_path
    end

	end

  	private
	def user_params
    	params.require( :user ).permit( :first_name, :last_name, :first_name_kana, :last_name_kana, :postal_code, :address, :phone_number, :email, :is_deleted )
  	end

end
