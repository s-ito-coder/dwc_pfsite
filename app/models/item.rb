class Item < ApplicationRecord
	belongs_to :user
    validates :introduction, length: { maximum: 5000 }
    has_many :favorites, dependent: :destroy
    has_many :favorite_users, through: :favorites, source: :user, dependent: :destroy
    attachment :image
    attachment :image2
    attachment :image3
    has_many :item_comments, dependent: :destroy

	def favorited_by?(user)
    	favorites.where(user_id: user.id).exists?
	end
end
