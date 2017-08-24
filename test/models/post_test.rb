require 'test_helper'

class PostTest < ActiveSupport::TestCase

	def setup
		@post = Post.new(title: "yo", body: "hello whats up this a test",
			user_id: 1)
	end 

	test "title is not empty" do 
		@post.title = " "
		@post.save 
		assert_not @post.valid?
	end 

	test "body is not empty" do 
		@post.body = " "
		@post.save 
		assert_not @post.valid?
	end 

	test "title is minimum of 6 chars" do 
		@post.title = "a" * 5 
		@post.save 
		assert_not @post.valid?
	end 

	test "body is maximum of 1000 chars" do 
		@post.body = "a" * 1001
		@post.save
		assert_not @post.valid?
	end 
end
