class Booking < ApplicationRecord
  belongs_to :package
  belongs_to :user

  validates :title, :location, :start_datetime, :end_datetime, :cost, :package_id, presence: true
  validates :status, presence: true, inclusion: { in: %w[Pending Accepted Rejected] }

end
