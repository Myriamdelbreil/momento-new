class TripChannel < ApplicationCable::Channel
  def subscribed
    trip = Trip.find(params[:id])
    stream_for trip
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
