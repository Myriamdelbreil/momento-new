class Expense < ApplicationRecord
  belongs_to :participant
  validates :amount, :title, presence: true
  after_initialize :set_defaults
  def set_defaults
    self.mutual ||= false
  end
end
