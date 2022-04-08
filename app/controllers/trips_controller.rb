class TripsController < ApplicationController
  def index
    @user = current_user
    @trips = @user.trips
    @trip = Trip.new
    @participant = Participant.new
    @coming_trips = @trips.select {|trip| trip.start_date > Time.now}
    @past_trips = @trips.select {|trip| trip.start_date < Time.now}
  end

  def show
    @trip = Trip.find(params[:id])
    @participants = @trip.participants
    @participant = @participants.find_by(user: current_user)
    # relatif aux transports
    @transportations = @participant.transportations
    @new_transportation = Transportation.new
    # relatif aux accomodations
    @accomodations = @trip.accomodations
    @new_accomodation = Accomodation.new
    # @markers = @accomodations.geocoded.map do |accomodation|
    #   {
    #     lat: accomodation.latitude,
    #     lng: accomodation.longitude,
    #     # info_window: render_to_string(partial: "info_window", locals: { accomodations: accomodation }),
    #     # image_url: helpers.asset_url("emplacement.png")
    #   }
    # end
    @new_accomodation_vote = AccomodationVote.new
    @accomodations.each do |accomodation|
      @accomodation_vote = accomodation.accomodation_votes
    end
    # relatif aux amis
    @users = User.all
    @new_participant = Participant.new
    # relatif aux dépenses :
    # à faire
    # relatif aux messages :
    @messages = @trip.messages
    # relatifs à l'agenda
    @new_event = Event.new
    @events = @trip.events
    @new_event_participant = EventParticipant.new
    @events.each do |event|
      @event_participants = event.event_participants
    end
  end

  def create
    @new_trip = Trip.new(trip_params)
    @user = current_user
    @new_trip.user = @user
    if @new_trip.save
      @participant = Participant.create!(user: @user, trip: @trip)
      redirect_to trip_path(@trip)
    else
      render "trips/index", alert: "Your trip couldn't have been created, sorry ! Try again"
    end
  end

  def update
    @trip = Trip.find(params[:id])
    if @trip.update(trip_params)
      redirect_to trip_path
    else
      render "trips/index", alert: "Your trip couldn't have been edited, sorry ! Try again"
    end
  end

  def destroy
    @trip = Trip.find(params[:id])
    @trip.destroy
    redirect_to trips_path
  end

  private

  def trip_params
    params.require(:trip).permit(:start_date, :end_date, :title, :description, :city, :photos)
  end
end

#test
