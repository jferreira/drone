class BookingsController < ApplicationController
  def index
    @package = Package.find(params[:package_id])
    @bookings = Booking.where(id: @package.id)
  end

  def new
    @package = Package.find(params[:package_id])
    @booking = Booking.new
  end

  def create
    @package = Package.find(params[:package_id])
    @booking = Booking.new(booking_params)
    @booking.status = 'Pending'
    @booking.package = @package
    @booking.user_id = current_user.id

    if @booking.save
      redirect_to package_path(@package)
      flash[:notice] = "Your booking request has been sent!"
    else
      render :new
      flash[:alert] = "There are some errors"
    end
  end

  def cancel_booking
    @booking = Booking.find(params[:id])
    @booking.status = 'Rejected'
    @booking.save
      redirect_to dashboard_path
  end

  def accept_booking
    @booking = Booking.find(params[:id])
    @booking.status = 'Accepted'
    @booking.save
      redirect_to dashboard_path
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def edit
    @package = Package.find(params[:package_id])
    @booking = Booking.find(params[:id])
  end

  def update
    @package = Package.find(params[:package_id])
    @booking = Booking.find(params[:id])
    @booking.update(booking_params)
    if @booking.save
      redirect_to package_booking_path(@package, @booking)
      flash[:notice] = "Your booking has been updated!"
    else
      render :edit
      flash[:alert] = "There are some errors"
    end
  end

  def destroy
  end

  private

  def booking_params
    params.require(:booking).permit(:title, :status, :location, :start_datetime, :end_datetime, :cost)
  end
end
