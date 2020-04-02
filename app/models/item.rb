class Item < ApplicationRecord
	belongs_to :user
    validates :introduction, length: { maximum: 5000 }
    has_many :favorites
    has_many :item_comments
    attachment :image

	def favorited_by?(user)
    	favorites.where(user_id: user.id).exists?
	end
end
