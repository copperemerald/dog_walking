class Booking < ApplicationRecord
  belongs_to :dog
  belongs_to :user

  validates :date, presence: true
  validates :comment, presence: true
  validates :status, presence: true, inclusion: { in: %w[pending accepted declined] }

  # Set a default status
  after_initialize :set_default_status, if: :new_record?

  private

  def set_default_status
    self.status ||= 'pending'
  end

end
