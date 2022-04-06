class TransportationsController < ApplicationController
  def index
    @trip = Trip.find(params[:id])
    @participant = current_user.participant
    @transportations = @participant.transportations
  end

  def create
    @participant = Participant.find_by(user_id: current_user.id)
    @trip = @participant.trip
    @new_transportation = Transportation.new(transportations_params)
    @new_transportation.participant = @participant
    if @new_transportation.save
      redirect_to trip_path(@participant.trip), notice: "Your ticket has been added!"
    else
      redirect_to trip_path(@participant.trip), alert: "Your ticket hasn't been added... Please retry"
    end
  end

  def update
    @transportation = Transportation.find(params[:id])
    @transportation.update(transportations_params)
    redirect_to trip_path(@transportation.participant.trip)
  end

  private

  def transportations_params
    params.require(:transportation).permit(:price, :origin, :mean, :destination, :departure_date, :arrival_date, :participant_id)
  end
end
