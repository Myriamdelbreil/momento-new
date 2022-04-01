class AccomodationVote < ApplicationRecord
  belongs_to :accomodation
  belongs_to :participant
end
