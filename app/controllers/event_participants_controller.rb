class EventParticipantsController < ApplicationController
  def index
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
  end
end
