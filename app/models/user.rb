class User < ApplicationRecord
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise :database_authenticatable, :registerable,
            :recoverable, :rememberable, :validatable
    validates :username, presence: true, length: {maximum: 20, minimum: 2}
    attachment :image
    has_many :orders
    has_many :items, dependent: :destroy
    has_many :favorites, dependent: :destroy
    has_many :favorite_items, through: :favorites, source: :item, dependent: :destroy

    def favorited_by?(user)
        favorites.where(user_id: user.id).exists?
    end
end
