class PackagesController < ApplicationController

  def index
    if params.key? "query"
      query = params[:query]
      @users = User.where(location: query).or

      @packages = []
      @users.each do |user|
        @packages << user.packages
      end

    else
      @packages = Package.all
    end
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



