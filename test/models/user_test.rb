require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(name: "Andreas", email: "user@example.com",
                   password: "firstpassword", password_confirmation: "firstpassword")
  end

  test "name should not be empty" do
    @user.name = " "
    assert_not @user.valid?
  end

  test "password should not be empty" do
    @user.password = @user.password_confirmation = " " * 6
    assert_not @user.valid?
  end

  test "password should be valid" do
    @user.password = @user.password_confirmation = "a" * 6
    assert @user.valid?
  end
end
