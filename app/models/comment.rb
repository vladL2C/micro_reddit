class Comment < ApplicationRecord
	validates :body, presence: true, length: { maximum: 255 }
	validates :post, presence: true
	validates :user, presence: true
	belongs_to :user
	belongs_to :post
end
