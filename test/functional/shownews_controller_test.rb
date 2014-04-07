require 'test_helper'

class ShownewsControllerTest < ActionController::TestCase
  test "should get newslist" do
    get :newslist
    assert_response :success
  end

end
