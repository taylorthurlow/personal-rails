require "test_helper"

class LoginsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @login = logins(:login_one)
    login_as :login_one
  end

  test "should create login" do
    assert_difference("Login.count") do
      post logins_url, params: { login: { password: "secret", username: "asdf" } }
    end

    assert_redirected_to posts_path
  end

  test "should update login" do
    patch login_url(@login), params: { login: { password: "secretss", username: "newusername" } }
    assert_redirected_to login_path(@login)
  end

  test "should destroy login" do
    assert_difference("Login.count", -1) do
      delete login_url(@login)
    end

    assert_redirected_to logins_path
  end
end
