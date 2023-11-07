class Dog < ApplicationRecord
  belongs_to :user
  has_many :bookings
  # adding info that has a picture attached
  has_one_attached :photo

  # Validations for Dog:

  validates :name, presence: true
  validates :location, presence: true
  validates :description, presence: true
end
