class Participant < ApplicationRecord
  belongs_to :user
  belongs_to :trip
  has_many :accomodation_votes,  dependent: :delete_all
  has_many :event_participants,  dependent: :delete_all
  has_many :events, dependent: :delete_all
  has_many :expenses, dependent: :delete_all
  has_many :messages, dependent: :delete_all
  has_many :transportations, dependent: :delete_all
  has_many_attached :photos

  def participates?(event)
    event_participants.find_by(event: event).present?
  end

  def votes?(accomodation)
    accomodation_votes.find_by(accomodation: accomodation).present?
  end
end
