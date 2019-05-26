require "test_helper"

class ApplicationControllerTest < ActionDispatch::IntegrationTest
  test "should authorize" do
    login_as :login_one
    @controller.send(:authorize)
  end
end
