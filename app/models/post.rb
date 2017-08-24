class Post < ApplicationRecord
	validates :title, presence: true, length: { minimum: 6}
	validates :body, presence: true, length: { maximum: 1000 }
	validates :user, presence: true
	belongs_to :user
	has_many :comments
end
