require 'test_helper'

class MikrotiksControllerTest < ActionController::TestCase
  setup do
    @mikrotik = mikrotiks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mikrotiks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mikrotik" do
    assert_difference('Mikrotik.count') do
      post :create, mikrotik: { ip: @mikrotik.ip, pass: @mikrotik.pass, port: @mikrotik.port, user: @mikrotik.user, user_id: @mikrotik.user_id }
    end

    assert_redirected_to mikrotik_path(assigns(:mikrotik))
  end

  test "should show mikrotik" do
    get :show, id: @mikrotik
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mikrotik
    assert_response :success
  end

  test "should update mikrotik" do
    put :update, id: @mikrotik, mikrotik: { ip: @mikrotik.ip, pass: @mikrotik.pass, port: @mikrotik.port, user: @mikrotik.user, user_id: @mikrotik.user_id }
    assert_redirected_to mikrotik_path(assigns(:mikrotik))
  end

  test "should destroy mikrotik" do
    assert_difference('Mikrotik.count', -1) do
      delete :destroy, id: @mikrotik
    end

    assert_redirected_to mikrotiks_path
  end
end
