require 'test_helper'

class PostTest < ActiveSupport::TestCase

	def setup
		@post = Post.new(title: "yo", body: "hello whats up this a test",
			user_id: 1)
	end 

	
end
