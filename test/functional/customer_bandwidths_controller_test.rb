require 'test_helper'

class CustomerBandwidthsControllerTest < ActionController::TestCase
  setup do
    @customer_bandwidth = customer_bandwidths(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:customer_bandwidths)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create customer_bandwidth" do
    assert_difference('CustomerBandwidth.count') do
      post :create, customer_bandwidth: { customer: @customer_bandwidth.customer, gdr: @customer_bandwidth.gdr, gur: @customer_bandwidth.gur, ip_device: @customer_bandwidth.ip_device, mdr: @customer_bandwidth.mdr, mup: @customer_bandwidth.mup }
    end

    assert_redirected_to customer_bandwidth_path(assigns(:customer_bandwidth))
  end

  test "should show customer_bandwidth" do
    get :show, id: @customer_bandwidth
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @customer_bandwidth
    assert_response :success
  end

  test "should update customer_bandwidth" do
    put :update, id: @customer_bandwidth, customer_bandwidth: { customer: @customer_bandwidth.customer, gdr: @customer_bandwidth.gdr, gur: @customer_bandwidth.gur, ip_device: @customer_bandwidth.ip_device, mdr: @customer_bandwidth.mdr, mup: @customer_bandwidth.mup }
    assert_redirected_to customer_bandwidth_path(assigns(:customer_bandwidth))
  end

  test "should destroy customer_bandwidth" do
    assert_difference('CustomerBandwidth.count', -1) do
      delete :destroy, id: @customer_bandwidth
    end

    assert_redirected_to customer_bandwidths_path
  end
end
