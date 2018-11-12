class PackagesController < ApplicationController

  def index
    @packages = Package.all
  end

  def new
    @package = Package.new
  end

  def create
    current_user

    @package = Package.new(package_params)

    @package.user_id = current_user.id
    if @package.save
      redirect_to packages_path
      flash[:notice] = "Your package has been created"
    else
      render :new
      flash[:alert] = "There are some errors"
    end
  end

  def show
    @package = Package.find(params[:id])
    @bookings = Booking.find(@package.booking_ids)
  end
  # def edit
  #   @package = Package.find(params[:id])
  # end
  # def update
  #   if @package.update(package_params)
  #     # redirect_to ___________
  #   else
  #     render :edit
  #   end
  # end

  def destroy
    @package = Package.find(params[:id])
    @package.destroy
    redirect_to packages_path
  end

  # private

  def package_params
  params.require(:package).permit(:title, :description, :url_image, :price, :photo)
  end

end



