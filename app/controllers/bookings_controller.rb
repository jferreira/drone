class BookingsController < ApplicationController
  def index
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
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def booking_params
    params.require(:booking).permit(:title, :location, :start_datetime, :end_datetime, :cost)
  end
end
