require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  should have_many(:user_friendships)
  should have_many(:friends)
  
  test "a user should enter a first name" do
    user = User.new
    assert !user.save  #makes sure this User used for test is not saved in db
    assert !user.errors[:first_name].empty?
  end
  
  test "a user should enter a last name" do
    user = User.new
    assert !user.save  #makes sure this User used for test is not saved in db
    assert !user.errors[:last_name].empty?
  end
  
  test "a user should enter a profile name" do
    user = User.new
    assert !user.save  #makes sure this User used for test is not saved in db
    assert !user.errors[:profile_name].empty?
  end
 
  test "a user should have a unique profile name" do
    user = User.new(first_name: 'Nick', last_name: "Sween", email: 'nsweenTest@testtest.com')
    user.password = user.password_confirmation = 'asdasdasd'
    
    user.profile_name = users(:jason).profile_name  # info for this @ users.yml
    assert !user.save  #makes sure this User used for test is not saved in db
    puts user.errors.inspect
    assert !user.errors[:profile_name].empty?
  end
  
  test "a user should have a profile name without spaces" do
    user = User.new
    user.profile_name = "My Profile with Spaces"
    assert !user.save
    assert !user.errors[:profile_name].empty?
    assert user.errors[:profile_name].include?("Must be formatted correctly.")
  end
  
  test " a user can have a correctly formated profile name" do
    user = User.new(first_name: 'Nick', last_name: "Sween", email: 'nsweenTest@testtest.com')
    user.password = user.password_confirmation = 'asdasdasd'
    
    user.profile_name = 'nsweentestest_1'
    assert user.valid?
     
  end
  
  test "no error is raised when trying to access a friend list" do
    assert_nothing_raised do
      users(:jason).friends
    end
  end
  
  test "that creating friendships on a user works" do
    users(:jason).friends << users(:mike)
    users(:jason).friends.reload
    assert users(:jason).friends.include?(users(:mike))
  end
  
end
