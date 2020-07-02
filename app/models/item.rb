class Item < ApplicationRecord
	belongs_to :user
    validates :introduction, presence: true, length: { maximum: 5000 }
    validates :name, presence: true, length: { maximum: 20 }
    has_many :favorites, dependent: :destroy
    has_many :favorite_users, through: :favorites, source: :user, dependent: :destroy
    attachment :image
    attachment :image2
    attachment :image3
    has_many :item_comments, dependent: :destroy
    has_one :order

end
