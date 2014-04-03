require 'test_helper'

class Admin::TnewsControllerTest < ActionController::TestCase
  setup do
    @admin_tnews = admin_tnews(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_tnews)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_tnews" do
    assert_difference('Admin::Tnews.count') do
      post :create, admin_tnews: { content: @admin_tnews.content, title: @admin_tnews.title }
    end

    assert_redirected_to admin_tnews_path(assigns(:admin_tnews))
  end

  test "should show admin_tnews" do
    get :show, id: @admin_tnews
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_tnews
    assert_response :success
  end

  test "should update admin_tnews" do
    put :update, id: @admin_tnews, admin_tnews: { content: @admin_tnews.content, title: @admin_tnews.title }
    assert_redirected_to admin_tnews_path(assigns(:admin_tnews))
  end

  test "should destroy admin_tnews" do
    assert_difference('Admin::Tnews.count', -1) do
      delete :destroy, id: @admin_tnews
    end

    assert_redirected_to admin_tnews_index_path
  end
end
