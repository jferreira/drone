class PackagesController < ApplicationController

  def index
    @packages = Package.all
    #@packages = Package.where.not(latitude: nil, longitude: nil)

    # @markers = @packages.map do |flat|
    #   {
    #     lat: package.latitude,
    #     lng: package.longitude#,
    #     # infoWindow: { content: render_to_string(partial: "/flats/map_box", locals: { flat: flat }) }
    #   }
    #   end
  end

  def new
    @package = Package.new
  end

  def create
    current_user

    @package = Package.new(package_params)

    # Hard code
    @package.user_id = 1
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
  # def destroy
  #   @package.destroy
  #   package.save
  # end

  # private

  def package_params
  params.require(:package).permit(:title, :description, :url_image, :price, :photo)
  end

end



