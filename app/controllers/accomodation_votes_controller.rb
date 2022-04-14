class AccomodationVotesController < ApplicationController
  def create
    @accomodation = Accomodation.find(params[:accomodation_id])
    @participant = Participant.find_by(user: current_user, trip: @accomodation.trip)
    @votes = @accomodation.accomodation_votes.count
    @new_accomodation_vote = AccomodationVote.new(participant: @participant, accomodation: @accomodation, vote: @votes += 1)
    if @new_accomodation_vote.save
      redirect_to trip_path(@accomodation.trip), notice: "Your vote has been counted!"
    else
      redirect_to trip_path(@accomodation.trip), alert: "Sorry, something happened... Please try again 🙁"
    end
  end

  def destroy
    @accomodation_vote = AccomodationVote.find(params[:accomodation_id])
    @accomodation = @accomodation_vote.accomodation
    @accomodation_vote.destroy
    redirect_to trip_path(@accomodation.trip)
  end
end
