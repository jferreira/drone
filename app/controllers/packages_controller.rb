class PackagesController < ApplicationController

  def index
    @packages = Package.all
  end

  # def new
  #   @package = Package.find(params[:id])
  # end

  # def create
  #   @package = Package.new(package_params)
  #   if package.save
  #     # redirect_to packages_path
  #   else
  #     render :new
  #   end
  # end
  # def show
  #   @package = Package.find(params[:id])
  # end
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

  # def package_params
  # params.require(:packages).permit(:title, :description, :url_image, :price)
  # end

end
