class AccomodationVotesController < ApplicationController
  def create
    @accomodation = Accomodation.find(params[:accomodation_id])
    @participant = Participant.find_by(user: current_user, trip: @accomodation.trip)
    @votes = @accomodation.accomodation_votes.count
    @new_accomodation_vote = AccomodationVote.new(participant: @participant, accomodation: @accomodation, vote: @votes +=1 )
    @new_accomodation_vote.save!
    authorize @new_accomodation_vote
    redirect_to trip_path(@accomodation.trip)
  end

  def destroy
    @accomodation_vote = AccomodationVote.find(params[:accomodation_id])
    @accomodation = @accomodation_vote.accomodation
    @accomodation_vote.destroy
    authorize @accomodation_vote
    redirect_to trip_path(@accomodation.trip)
  end
end
