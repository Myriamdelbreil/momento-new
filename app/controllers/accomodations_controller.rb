class AccomodationsController < ApplicationController
  before_action :find_trip

  def find_trip
    @trip = Trip.find(params[:trip_id])
  end

  def index
    @accomodations = @trip.accomodations
  end

  def show

  end

  def create
    @new_accomodation = Accomodation.new(accomodations_params)
    @new_accomodation.trip = @trip
    @participant = Participant.find_by(user: current_user, trip: @trip)
    if @new_accomodation.save
      AccomodationVote.create(participant: @participant, accomodation: @new_accomodation)
      redirect_to trip_path(@trip), notice: "Cool, ton logement a été ajouté !"
    else
      redirect_to trip_path(@trip), alert: "Désolé, il y a eu un bug..."
    end
  end

  def update
    @accomodation = Accomodation.find(params[:id])
    @accomodation.update(accomodations_params)
  end

  def destroy
    @accomodation = Accomodation.find(params[:id])
    @trip = @accomodation.trip
    @accomodation.destroy
    redirect_to trip_path(@trip), alert: "Le logement a été supprimée de la liste."
  end

  def confirm_accomodation
    @accomodation = Accomodation.find(params[:id])
    if @accomodation.confirmed == true
      @accomodation.update(confirmed: false)
    else
      @accomodation.update(confirmed: true)
    end
    @trip = @accomodation.trip
    redirect_to trip_path(@trip)
  end

  private

  def accomodations_params
    params.require(:accomodation).permit(:confirmed, :address, :url, :picked, :trip_id, :id, :title, :description, :price, :img, :latitude, :longitude)
  end
end
