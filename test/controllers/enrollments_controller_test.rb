require "test_helper"

class EnrollmentsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get enrollments_new_url
    assert_response :success
  end

  test "should get create" do
    get enrollments_create_url
    assert_response :success
  end
end
