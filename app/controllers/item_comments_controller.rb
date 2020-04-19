class ItemCommentsController < ApplicationController
	before_action :authenticate_user!

	def create
		@item = Item.find(params[:item_id])
		@item_new = Item.new
		@item_comment = @item.item_comments.new(item_comment_params)
		@item_comment.user_id = current_user.id
		if @item_comment.save
			flash[:success] = "Comment was successfully created."
			redirect_to item_path(@item)
		else
			@item_comments = ItemComment.where(item_id: @item.id)
			render '/items/show'
		end
	end

	def destroy
		@item_comment = ItemComment.find(params[:item_id])
		if @item_comment.user != current_user
			redirect_to request.referer
		end
		@item_comment.destroy
		redirect_to request.referer

	end

	private

	def item_comment_params
		params.require(:item_comment).permit(:comment)
	end

end
