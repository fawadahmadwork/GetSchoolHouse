require "application_system_test_case"

class PodsTest < ApplicationSystemTestCase
  setup do
    @pod = pods(:one)
  end

  test "visiting the index" do
    visit pods_url
    assert_selector "h1", text: "Pods"
  end

  test "should create pod" do
    visit pods_url
    click_on "New pod"

    fill_in "Address", with: @pod.address
    fill_in "Grade", with: @pod.grade
    fill_in "Name", with: @pod.name
    click_on "Create Pod"

    assert_text "Pod was successfully created"
    click_on "Back"
  end

  test "should update Pod" do
    visit pod_url(@pod)
    click_on "Edit this pod", match: :first

    fill_in "Address", with: @pod.address
    fill_in "Grade", with: @pod.grade
    fill_in "Name", with: @pod.name
    click_on "Update Pod"

    assert_text "Pod was successfully updated"
    click_on "Back"
  end

  test "should destroy Pod" do
    visit pod_url(@pod)
    click_on "Destroy this pod", match: :first

    assert_text "Pod was successfully destroyed"
  end
end
