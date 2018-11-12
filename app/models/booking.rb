class Booking < ApplicationRecord
  belongs_to :package
  belongs_to :user

  validates :location, :start_datetime, :end_datetime, :package_id, presence: true
  validates :status, presence: true, inclusion: { in: %w[Pending Accepted Rejected] }

end
