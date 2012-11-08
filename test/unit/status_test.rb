require 'test_helper'

class StatusTest < ActiveSupport::TestCase
  test "that a status requires content" do
    status = Status.new
    assert !status.save
    assert !status.errors[:content].empty?
    end

   test "that a status requires atleast 2 characters" do
    status = Status.new
    status.content = "D"
    assert !status.save
    assert !status.errors[:content].empty?
   end

   test " that a status has a user id" do
   	status = Status.new
   	status.content = "test"
   	assert !status.save
   	assert !status.errors[:user_id].empty?
   end

end
