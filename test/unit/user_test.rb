require 'test_helper'

class UserTest < ActiveSupport::TestCase
  

  should have_many(:user_friendships)
  should have_many(:friends)

  test " a user should enter a first name" do 
  	user = User.new
  	assert !user.save
  	assert !user.errors[:first_name].empty?
  end

  test " a user should enter a last name" do 
  	user = User.new
  	assert !user.save
  	assert !user.errors[:last_name].empty?
  end

  test " a user should enter a profile name" do 
  	user = User.new
  	assert !user.save
  	assert !user.errors[:profile_name].empty?
  end

  test "a user should have a unique profile name" do
  	user = User.new
  	user.email = "d.d.love20@gmail.com"
  	user.profile_name = users(:dlove).profile_name
  	

  	assert !user.save
  	assert !user.errors[:profile_name].empty?
    assert !user.errors[:profile_name].include?("Must be formatted correctly.")
  end

  test "A user should have a properly formatted profile name" do
    user = User.new(first_name: 'Dtest', last_name: 'Love', email: 'test@gmail.com')
    user.password = user.password_confirmation = 'asdfasdf'

    user.profile_name = 'dlovetest_1'
    assert user.valid?
  end

  test "That no error is raised when trying to access a friend list" do
    assert_nothing_raised do
      users(:dlove).friends
    end
  end

  test "that creaing friendsp on a user works" do
    users(:dlove).friends << users(:mike)
    users(:dlove).friends.reload
    assert users(:dlove).friends.include?(users(:mike))
  end


end
