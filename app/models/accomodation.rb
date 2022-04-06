class Accomodation < ApplicationRecord
  belongs_to :trip
  has_many :accomodation_votes
end
