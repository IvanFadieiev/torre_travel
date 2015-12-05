require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "should get administration" do
    get :administration
    assert_response :success
  end

end
