class DashboardController < ApplicationController

  def my_dashboard
    @bookings = Booking.where(id: current_user.id)


  end
end
