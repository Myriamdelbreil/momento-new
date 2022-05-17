class MessagesController < ApplicationController

  def show
    @trip = Trip.find(params[:trip_id])
    @messages = Message.where(trip: @trip)
    @message = Message.find(params[:id])
  end

  def create
    @trip = Trip.find(params[:trip_id])
    @participant = Participant.find_by(user: current_user, trip: @trip)
    @new_message = Message.new(message_params)
    @new_message.participant = @participant
    @new_message.trip = @trip
    if @new_message.save
      TripChannel.broadcast_to(
        @trip,
        message_html: render_to_string(partial: "messages/message", locals: {message: @new_message}),
        auhtor_id: current_user.id
      )
      head :ok
      # redirect_to trip_path(@trip, anchor: "message-#{@new_message.id}")
    else
      redirect_to trip_path(@trip, anchor: "message-#{@new_message.id}")
    end
  end

  private

  def message_params
    params.require(:message).permit(:participant_id, :trip_id, :id, :content)
  end

end
