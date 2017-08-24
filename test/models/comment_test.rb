require 'test_helper'

class CommentTest < ActiveSupport::TestCase

	def setup
		@comment = Comment.new(body: "hello this a test comment",
			post_id: 1, user_id: 2)
	end 

	test "the body is not empty" do 
		@comment.body = "hello this is a test comment"
		@comment.save 
		assert_not @comment.valid?
	end 

	test "the body does not exceed 255 characters" do 
		@comment.body = "a" * 256
		@comment.save
		assert_not @comment.valid?
	end 

end
