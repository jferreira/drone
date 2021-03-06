class UsersController < ApplicationController
#   def index
#   end

  # def new
  #   @user = User.find(params[:id])
  # end

  # def create
  #   @user = User.new(user_params)
  #   if user.save
  #     redirect_to user_path(@user)
  #   else
  #     render :new
  #   end
  # end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update(user_params)
    redirect_to packages_path
  end

  # def show
  #   @user = User.find(params[:id])
  # end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :location, :url_image)
  end
end
