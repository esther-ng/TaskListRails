require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "User must have an email, uid and provider" do
    user = User.new(name: "joe")
    assert_not user.valid?
    user2 = User.new(email: "something@som.com")
    assert_not user2.valid?
    user3 = User.new(email: "a@me.com", uid: 55253, provider: "github")
    assert user3.valid?
  end
end
