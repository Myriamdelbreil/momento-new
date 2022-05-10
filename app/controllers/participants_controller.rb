class ParticipantsController < ApplicationController
  before_action :find_trip, only: [ :index, :create, :update ]
  def find_trip
    @trip = Trip.find(params[:trip_id])
  end

  def index
    @participants = @trip.participants
  end

  def create
    @participant = Participant.new(participant_params)
    @participant.trip = @trip
    if @participant.save
      redirect_to trip_path(@trip), notice: "Cool ! #{@participant.user.username.capitalize} rejoint ton voyage !"
    else
      render trip_path(@trip), alert: "Oups... Ca n'a pas marché, désolés..."
    end
  end

  def update
    @participant = @trip.participants.find_by(user: current_user)
    if @participant.update(participant_params)
      redirect_to trip_path(trip)
      raise
    else
      render "trips/index", alert: "Your photo hasn't been uploaded ! Try again"
    end
  end

  def destroy
    @participant = Participant.find(params[:id])
    username = @participant.user.username
    @trip = @participant.trip
    @participant.destroy
    redirect_to trip_path(@trip), alert: "#{username} ne vient plus avec vous, dommage !"
  end

  private

  def participant_params
    params.require(:participant).permit(:user_id, :trip_id, :photos)
  end
end
