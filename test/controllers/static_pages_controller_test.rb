require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test 'should get portfolio' do
    get portfolio_url
    assert_response :success
  end
end
