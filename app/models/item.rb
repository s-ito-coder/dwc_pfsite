class Item < ApplicationRecord
	belongs_to :user
    validates :introduction, length: { maximum: 5000 }
end
