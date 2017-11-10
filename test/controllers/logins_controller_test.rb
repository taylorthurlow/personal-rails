require 'test_helper'

class LoginsControllerTest < ActionController::TestCase
  setup do
    @login = logins(:login_one)
    login_as :login_one
  end

  test 'should create login' do
    assert_difference('Login.count') do
      post :create, login: { password: 'secret', username: 'asdf' }
    end

    assert_redirected_to posts_path
  end

  test 'should update login' do
    patch :update, id: @login, login: { password: 'secretss', username: 'newusername' }
    assert_redirected_to login_path(@login)
  end

  test 'should destroy login' do
    assert_difference('Login.count', -1) do
      delete :destroy, id: @login
    end

    assert_redirected_to logins_path
  end
end
