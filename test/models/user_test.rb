require 'test_helper'

class UserTest < ActiveSupport::TestCase
	
	def setup
		@user = User.new(name: "Vlad", email: "vlad@hotmail.co.nz",
			password: "foobar", password_confirmation: "foobar")
	end

	test "password should be present (non blank)" do 
		@user.password = @user.password_confirmation = " " * 6
		assert_not @user.valid?
	end

	test "password should have minimum length" do 
		@user.password = @user.password_confirmation = "a" *5
		assert_not @user.valid?
	end

	test "emails should be saved as lower-case" do 
		@user.email = "vLaD@HOTmaIL.CO.NZ"
		@user.save 
		assert_equal(@user.email.downcase, @user.reload.email) 
	end 

	test "emails should have valid email addresses" do 
		valid_addresses = %w[user@example.com USER@foo.com A_US-ER@foo.bar.org first.last@foo.jp alice+bob@baz.cn]
		valid_addresses.each do |valid_email|
			@user.email = valid_email 
			assert @user.valid?, "#{valid_email.inspect} should be valid"
		end 
	end 

	test "invalid emails should be rejected" do 
		invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com foo@bar..com]
        invalid_addresses.each do |invalid_email|
        	@user.email = invalid_email 
        	assert_not @user.valid?, "#{invalid_email.inspect} should be invalid"  
        end
    end  

    test "email address should be unique" do 
    	duplicate_user = @user.dup 
    	duplicate_user.email = @user.email.upcase  
    	@user.save 
    	assert_not duplicate_user.valid? 
    end 

    test "name should not be more than 15 chars" do 
    	@user.name = "a" * 16
    	@user.save 
    	assert_not @user.valid? 
    end

    test "email should not be more than 255 chars" do 
       @user.email = "a" * 244 + "@example.com"
       @user.save 
       assert_not @user.valid? 
    end

    test "name should not be blank" do 
    	@user.name = " "
    	@user.save 
    	assert_not @user.valid?
    end                 	

end
