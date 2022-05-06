class Expense < ApplicationRecord
  belongs_to :participant
  belongs_to :trip
  validates :amount, :title, presence: true
  after_initialize :set_defaults
  def set_defaults
    self.mutual ||= false
  end
end
