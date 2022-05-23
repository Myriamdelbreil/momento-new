class TransportationsController < ApplicationController
  def index
    @trip = Trip.find(params[:id])
    @participant = Participant.find_by(user_id: current_user.id, trip_id: @trip.id)
    @transportations = @participant.transportations.order('departure_date ASC')
  end

  def create
    @trip = Trip.find(params[:trip_id])
    @participant = Participant.find_by(user_id: current_user.id, trip_id: @trip.id)
    @new_transportation = Transportation.new(transportations_params)
    @new_transportation.participant = @participant
    # @new_transportation.departure_date = @trip.start_date if @participant.transportations.count.zero?
    if @new_transportation.departure_date > @new_transportation.arrival_date
      redirect_to trip_path(@trip), alert: "Ta date de départ est après ta date d'arrivée, réessaie !"
    elsif @new_transportation.save
      redirect_to trip_path(@trip), notice: "Ton ticket a été ajouté !"
    else
      redirect_to trip_path(@trip), alert: "Oups ! Désolés, quelque chose n'a pas marché... Réessaie !"
    end
  end

  def update
    @transportation = Transportation.find(params[:id])
    @transportation.update(transportations_params)
    redirect_to trip_path(@transportation.participant.trip)
  end

  def destroy
    @transportation = Transportation.find(params[:id])
    @trip = Trip.find(params[:trip_id])
    @participant = Participant.where(user: current_user, trip: @trip)
    @transportation.destroy
    redirect_to trip_path(@trip), alert: "Ton ticket a été supprimé."
  end


  private

  def transportations_params
    params.require(:transportation).permit(:price, :origin, :mean, :destination, :departure_date, :arrival_date, :participant_id)
  end
end
