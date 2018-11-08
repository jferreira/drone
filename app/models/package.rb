class Package < ApplicationRecord
  belongs_to :user
#   has_many :reviews
  has_many :bookings
  validates :title, :description, :price_per_hour, presence: true
end
