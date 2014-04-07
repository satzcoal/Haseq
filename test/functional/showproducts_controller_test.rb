require 'test_helper'

class ShowproductsControllerTest < ActionController::TestCase
  test "should get newslist" do
    get :newslist
    assert_response :success
  end

end
