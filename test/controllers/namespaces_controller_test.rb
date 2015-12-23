require 'test_helper'

class NamespacesControllerTest < ActionController::TestCase
  setup do
    @namespace = namespaces(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:namespaces)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create namespace" do
    assert_difference('Namespace.count') do
      post :create, namespace: { status: @namespace.status, url_address: @namespace.url_address, url_key: @namespace.url_key }
    end

    assert_redirected_to namespace_path(assigns(:namespace))
  end

  test "should show namespace" do
    get :show, id: @namespace
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @namespace
    assert_response :success
  end

  test "should update namespace" do
    patch :update, id: @namespace, namespace: { status: @namespace.status, url_address: @namespace.url_address, url_key: @namespace.url_key }
    assert_redirected_to namespace_path(assigns(:namespace))
  end

  test "should destroy namespace" do
    assert_difference('Namespace.count', -1) do
      delete :destroy, id: @namespace
    end

    assert_redirected_to namespaces_path
  end
end
