require 'test_helper'

class ApplicationControllerTest < ActionController::TestCase
  test 'should authorize' do
    login_as :login_one
    @controller.send(:authorize)
  end

  test 'should not authorize' do
    @controller.stubs(:authenticated?).returns(false)
    @controller.expects(:redirect_to).returns(true) # weird DelegationError if we don't do this
    @controller.send(:authorize)
  end
end
