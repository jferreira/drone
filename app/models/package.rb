class Package < ApplicationRecord
  belongs_to :user
#   has_many :reviews
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
  has_many :bookings
  validates :title, :description, :price, :url_image, presence: true
  mount_uploader :photo, PhotoUploader
end


