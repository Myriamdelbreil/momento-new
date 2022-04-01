class TripsController < ApplicationController
  def index
    @user = current_user
    @trips = @user.trip
    @trip = Trip.new
    @users = User.all
    @participant = Participant.new
    @trips = policy_scope(Trip)
    @coming_trips = @trips.select {|trip| trip.start_date > Time.now}
    @past_trips = @trips.select {|trip| trip.start_date < Time.now}
  end
end
