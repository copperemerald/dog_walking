class Dog < ApplicationRecord
  belongs_to :user
  has_many :bookings
  # adding info that has a picture attached
  has_one_attached :photo

  # Validations for Dog:

  validates :name, presence: true
  validates :location, presence: true
  validates :description, presence: true

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  def book
    update(booked: !booked)
  end
end
