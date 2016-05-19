require 'test_helper'

class StorefrontControllerTest < ActionController::TestCase
  test "should get all_vendors" do
    get :all_vendors
    assert_response :success
  end

  test "should get show" do
    get :show
    assert_response :success
  end

end
