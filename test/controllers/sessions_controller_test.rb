require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should get new when logged in' do
    post :create, username: 'MyString', password: 'secret'
    get :new
    assert_redirected_to posts_url
  end

  test 'should login' do
    post :create, username: 'MyString', password: 'secret'
    assert_not_nil session[:login_id]
    assert_redirected_to posts_url
  end

  test 'should not login' do
    post :create, username: 'MyString', password: 'wrong'
    assert_nil session[:login_id]
    assert_redirected_to new_session_url
  end

  test 'should destroy' do
    delete :destroy
    assert_nil session[:login_id]
    assert_redirected_to root_url
  end
end
