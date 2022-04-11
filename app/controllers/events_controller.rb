class EventsController < ApplicationController
  def index
    @trip = Trip.find(params[:trip_id])
    @events = @trip.events
  end

  def new
    @new_event = Event.new
    @trip = Trip.find(params[:trip_id])
    @participant = Participant.find_by(user_id: current_user.id, trip_id: @trip.id)
  end

  def create
    @new_event = Event.new(event_params)
    @trip = Trip.find(params[:trip_id])
    @participant = Participant.find_by(user_id: current_user.id, trip_id: @trip.id)
    @new_event.participant = @participant
    @new_event.trip = @trip
    if @new_event.save
      EventParticipant.create(event: @new_event, participant: @participant)
      redirect_to trip_path(@trip), notice: "Your event is now in the calendar!"
    else
      redirect_to trip_path(@trip), alert: "Your event can't be saved... Please retry :("
    end
  end

  def update
    @event = Event.find(params[:id])
    @trip = @event.trip
    @event.update(event_params)
    redirect_to trip_path(@trip)
  end

  def destroy
    @event = Event.find(params[:id])
    @trip = @event.trip
    @event.destroy
    redirect_to trip_path(@trip)
  end

  private

  def event_params
    params.require(:event).permit(:description, :start_date, :end_date, :category)
  end
end
