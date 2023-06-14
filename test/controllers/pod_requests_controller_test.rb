require "test_helper"

class PodRequestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pod_request = pod_requests(:one)
  end

  test "should get index" do
    get pod_requests_url
    assert_response :success
  end

  test "should get new" do
    get new_pod_request_url
    assert_response :success
  end

  test "should create pod_request" do
    assert_difference("PodRequest.count") do
      post pod_requests_url, params: { pod_request: { child_id: @pod_request.child_id, pod_id: @pod_request.pod_id, status: @pod_request.status } }
    end

    assert_redirected_to pod_request_url(PodRequest.last)
  end

  test "should show pod_request" do
    get pod_request_url(@pod_request)
    assert_response :success
  end

  test "should get edit" do
    get edit_pod_request_url(@pod_request)
    assert_response :success
  end

  test "should update pod_request" do
    patch pod_request_url(@pod_request), params: { pod_request: { child_id: @pod_request.child_id, pod_id: @pod_request.pod_id, status: @pod_request.status } }
    assert_redirected_to pod_request_url(@pod_request)
  end

  test "should destroy pod_request" do
    assert_difference("PodRequest.count", -1) do
      delete pod_request_url(@pod_request)
    end

    assert_redirected_to pod_requests_url
  end
end
