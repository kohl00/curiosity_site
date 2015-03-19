class SplashController < ApplicationController
	layout 'splash'
  def welcome
  	redirect_to recipes_path if user_signed_in?
  end
end
