class AccomodationVote < ApplicationRecord
  belongs_to :accomodation
  belongs_to :participant

  def set_defaults
    self.votes ||= 0
  end
end
