class Trip < ApplicationRecord
  has_many :accomodations, dependent: :destroy
  has_many :events, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :participants, dependent: :destroy
  validates :start_date, :end_date, :title, presence: true
  validates :title, presence: true, length: { maximum: 25 }
  belongs_to :user
  has_one_attached :photo
  geocoded_by :city
  after_validation :geocode, if: :geocoding_needed?

  def geocoding_needed?
    will_save_change_to_city? && will_save_change_to_latitude? && will_save_change_to_longitude?
  end
end
