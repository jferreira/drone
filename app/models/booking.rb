class Booking < ApplicationRecord
  belongs_to :package
  belongs_to :user

  validates :title, presence: true
end
