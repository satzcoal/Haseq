require 'test_helper'

class TnewsControllerTest < ActionController::TestCase
  setup do
    @tnews = tnews(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tnews)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tnews" do
    assert_difference('Tnews.count') do
      post :create, tnews: { content: @tnews.content, title: @tnews.title }
    end

    assert_redirected_to tnews_path(assigns(:tnews))
  end

  test "should show tnews" do
    get :show, id: @tnews
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tnews
    assert_response :success
  end

  test "should update tnews" do
    put :update, id: @tnews, tnews: { content: @tnews.content, title: @tnews.title }
    assert_redirected_to tnews_path(assigns(:tnews))
  end

  test "should destroy tnews" do
    assert_difference('Tnews.count', -1) do
      delete :destroy, id: @tnews
    end

    assert_redirected_to tnews_index_path
  end
end
