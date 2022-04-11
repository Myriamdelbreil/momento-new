class EventParticipantsController < ApplicationController
  def index
    @event = Event.find(params[:event_id])
    @event_participants = @event.event_participants
  end

  def create
    @event = Event.find(params[:event_id])
    @participant = Participant.find_by(user: current_user, trip: @event.trip)
    @new_event_participant = EventParticipant.new(participant: @participant, event: @event)
    if @new_event_participant.save
      redirect_to trip_path(@event.trip), notice: "Congrats, you joined #{@event.description} !"
    else
      redirect_to trip_path(@event.trip), alert: "Sorry, something happened... Please try again :("
    end
  end

  def destroy
    @event_participant = EventParticipant.find(params[:id])
    @event = @event_participant.event
    @event_participant.destroy
    redirect_to trip_path(@event.trip)
  end
end
