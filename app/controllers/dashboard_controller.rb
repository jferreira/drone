class DashboardController < ApplicationController

  def my_dashboard
    # @bookings = Booking.where(user_id: current_user.id)
    # @my_packages = Package.where(user_id: current_user.id).pluck(:id) # [1,2,3]
    # @my_jobs = Booking.where(:package_id => @my_packages)

    @bookings = current_user.bookings
    @my_packages = current_user.packages
    @my_jobs = Booking.where(:package_id => @my_packages)


  end

end
