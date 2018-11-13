class PackagesController < ApplicationController

  skip_before_action :authenticate_user!, only: :index

  def index
    # MAP  --------------------------
    @valid_packages = Package.where.not(latitude: nil, longitude: nil)
    @markers = @valid_packages.map do |package|
      {
        lat: package.latitude,
        lng: package.longitude,
        infoWindow: { content: render_to_string(partial: "/packages/map_box", locals: { package: package }) }
      }
    end


    # SEARCH FILTER --------------------------
    if params[:query].present?
      sql_query = " \
        packages.location @@ :query \
        OR users.location @@ :query \
        OR users.first_name @@ :query \
        OR users.last_name @@ :query \
      "
      @packages = Package.joins(:user).where(sql_query, query: "%#{params[:query]}%")

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

  def edit
    @package = Package.find(params[:id])
  end

  def update
    @package = Package.find(params[:id])
    @package.update(package_params)
    redirect_to packages_path
  end

  def destroy
    @package = Package.find(params[:id])
    @package.destroy
    redirect_to packages_path
  end

  # private

  def package_params
  params.require(:package).permit(:title, :description, :price, :photo)
  end

end
