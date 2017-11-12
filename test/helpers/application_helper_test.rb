require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  test 'should get current user' do
    login_as :login_one
    assert_not_nil current_user
  end

  test 'should be authenticated' do
    login_as :login_one
    assert authenticated?
  end

  test 'should not be authenticated' do
    assert !authenticated?
  end
end
