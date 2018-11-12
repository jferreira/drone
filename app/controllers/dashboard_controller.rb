class DashboardController < ApplicationController

  def my_dashboard
    @bookings = Booking.where(user_id: current_user.id)
  end

end
