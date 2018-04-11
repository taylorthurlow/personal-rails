require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test 'should get portfolio' do
    get :portfolio
    assert_response :success
  end
end
