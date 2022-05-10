require "test_helper"

class TripsControllerTest < ActionDispatch::IntegrationTest
  test "should not save trip without title" do
    trip = Trip.new
    assert_not trip.save, "Saved the trip without a title"
  end

  test "should go to trips#index page" do
    get trips_path
  end
end
