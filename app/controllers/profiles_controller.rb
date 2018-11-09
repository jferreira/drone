# class ProfilesController < ApplicationController
#   before_filter :authenticate_user!

#   def show
#     @profile = Profile.find(params[:id])
#   end

#   # def edit
#   #    @profile = Profile.find(params[:id])
#   # end

#   # def update
#   #    @profile.update(profile_params)
#   #     # redirect_to ___________
#   #   else
#   #     render :edit
#   #   end
#   end

# def profile_params
#   params.require(:profiles).permit(:first_name, :last_name, :location)
# end

# end
