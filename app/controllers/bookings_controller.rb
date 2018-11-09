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
    @booking.user_id = 1

    if @booking.save!
      redirect_to package_path(@package)
    else
      render :new
    end
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
    else
      render :edit
    end
  end

  def destroy
  end

  private

  def booking_params
    params.require(:booking).permit(:title, :status, :location, :start_datetime, :end_datetime, :cost)
  end
end
