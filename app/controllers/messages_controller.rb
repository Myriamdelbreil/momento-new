class MessagesController < ApplicationController

  def show
    @trip = Trip.find(params[:trip_id])
    @messages = Message.where(trip: @trip)
    @message = Message.find(params[:id])
  end

  def create
    @participant = Participant.find(params[:participant_id])
    @trip = @participant.trip
    @new_message = Message.new(message_params)
    @new_message.participant = @participant
    @new_message.trip = @trip
    if @new_message.save
      TripChannel.broadcast_to(
        @trip,
        message_html: render_to_string(partial: "trip_details/message", locals: {message: @new_message}),
        auhtor_id: current_user.id
      )
      head :ok
      # redirect_to trip_path(@trip, anchor: "message-#{@new_message.id}")
    else
      redirect_to trip_path(@trip, anchor: "message-#{@new_message.id}")
    end
  end

end
