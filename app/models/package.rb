class Package < ApplicationRecord
  belongs_to :user
  has_many :bookings

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  validates :title, :description, :price, presence: true
  mount_uploader :photo, PhotoUploader
end


