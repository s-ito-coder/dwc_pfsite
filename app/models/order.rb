class Order < ApplicationRecord
	belongs_to :user
	belongs_to :item
	attachment :image
end
