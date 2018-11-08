class BookingsController < ApplicationController

  def index
    @bookings = Booking.new
  end

  def new
    @booking = Booking.find(params[:package_id])
  end

  def create
     @booking = Booking.new(booking_params)
     @booking.package = booking
    if booking.save
      # redirect_to packages_path
    else
      render :new
    end
  end

  def show
     @booking = Booking.find(params[:package_id])
  end

  def edit
    @booking = Booking.find(params[:package_id])
  end

  def update
    if @booking.update(booking_params)
      # redirect_to ___________
    else
      render :edit
    end
  end

  def destroy
    @booking.destroy
    booking.save
  end

  private

  def booking_params
    params.require(:bookings).permit(:title, :status, :location, :start_datetime, :end_datetime, :cost)
  end

end
