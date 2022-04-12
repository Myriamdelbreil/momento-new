class Trip < ApplicationRecord
  belongs_to :user
  has_many :accomodations, dependent: :destroy
  has_many :events, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :participants, dependent: :destroy
  validates :start_date, :end_date, :title, presence: true
  validates :title, presence: true, length: { maximum: 25 }
  has_one_attached :photo
end
