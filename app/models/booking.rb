class Booking < ApplicationRecord
  belongs_to :package
  belongs_to :user

  validates :title, :location, :start_datetime, :end_datetime, :cost, :package_id, presence: true
  validates :status, :presence: true, default: 'Pending', inclusion: { in: w%[Pending Accepted Rejected] }

  # def time_is_now?(date)
  #   DateTime.now > date
  # end
end
