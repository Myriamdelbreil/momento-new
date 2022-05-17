class Accomodation < ApplicationRecord
  belongs_to :trip
  has_many :accomodation_votes, dependent: :destroy
  validates :img, presence: true
  validates :title, presence: true
  geocoded_by :address
  after_validation :geocode, if: :geocoding_needed?

  # after_validation :scrap_appartment, if: :will_save_change_to_url?

  def geocoding_needed?
    will_save_change_to_address? && !will_save_change_to_latitude? && !will_save_change_to_longitude?
  end

end
