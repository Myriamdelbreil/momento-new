require "test_helper"

class TripsControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "should get trips index" do
    get 'trips#index_url'
    assert_response :success
    end
end
