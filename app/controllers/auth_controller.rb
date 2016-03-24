class AuthController < ApplicationController

  def facebook
    if params[:code].blank?
      render_error "Error with fb"
    else
      access_token = FacebookAuthService.get_access_token(params[:code])
      user_data = FacebookAuthService.get_user_data(access_token)
      render :text => user_data['email']
    end
  end


end
