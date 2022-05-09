require "test_helper"

class TripsControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "should not save trip without title" do
    trip = Trip.new
    assert_not trip.save, "Saved the trip without a title"
  end
end
