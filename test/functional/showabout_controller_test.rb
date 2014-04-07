require 'test_helper'

class ShowaboutControllerTest < ActionController::TestCase
  test "should get about" do
    get :about
    assert_response :success
  end

end
