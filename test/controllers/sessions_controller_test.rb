require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test 'should get new' do
    get new_session_url
    assert_response :success
  end

  test 'should get new when logged in' do
    post sessions_url, params: { username: 'MyString', password: 'secret' }
    get new_session_url
    assert_redirected_to posts_url
  end

  test 'should login' do
    post sessions_url, params: { username: 'MyString', password: 'secret' }
    assert_not_nil session[:login_id]
    assert_redirected_to posts_url
  end

  test 'should not login' do
    post sessions_url, params: { username: 'MyString', password: 'wrong' }
    assert_nil session[:login_id]
    assert_redirected_to new_session_url
  end

  test 'should destroy' do
    get logout_url
    assert_nil session[:login_id]
    assert_redirected_to root_url
  end
end
