require 'test_helper'

class WelcomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index$" do
    get welcome_index$_url
    assert_response :success
  end

  test "should get bin/rails" do
    get welcome_bin/rails_url
    assert_response :success
  end

  test "should get routes" do
    get welcome_routes_url
    assert_response :success
  end

end
