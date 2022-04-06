class Event < ApplicationRecord
  belongs_to :participant
  belongs_to :trip
  has_many :event_participants, dependent: :destroy
  ACTIVITIES = ["Beach", "Culture", "Night-out", "Restauration", "Shopping", "Sport", "Other"]
  validates :category, inclusion: { in: ACTIVITIES }
  validates :description, presence: true

end
