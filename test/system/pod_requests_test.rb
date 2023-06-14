require "application_system_test_case"

class PodRequestsTest < ApplicationSystemTestCase
  setup do
    @pod_request = pod_requests(:one)
  end

  test "visiting the index" do
    visit pod_requests_url
    assert_selector "h1", text: "Pod requests"
  end

  test "should create pod request" do
    visit pod_requests_url
    click_on "New pod request"

    fill_in "Child", with: @pod_request.child_id
    fill_in "Pod", with: @pod_request.pod_id
    fill_in "Status", with: @pod_request.status
    click_on "Create Pod request"

    assert_text "Pod request was successfully created"
    click_on "Back"
  end

  test "should update Pod request" do
    visit pod_request_url(@pod_request)
    click_on "Edit this pod request", match: :first

    fill_in "Child", with: @pod_request.child_id
    fill_in "Pod", with: @pod_request.pod_id
    fill_in "Status", with: @pod_request.status
    click_on "Update Pod request"

    assert_text "Pod request was successfully updated"
    click_on "Back"
  end

  test "should destroy Pod request" do
    visit pod_request_url(@pod_request)
    click_on "Destroy this pod request", match: :first

    assert_text "Pod request was successfully destroyed"
  end
end
