class BaseApiController < ApplicationController
  before_filter :parse_request, :authenticate_user_from_token!

  private
  def authenticate_user_from_token!
    if !@api_token
      render nothing: true, status: :unauthorized
    else
      @user = nil
      User.find_each do |u|
        if Devise.secure_compare(u.api_token, @api_token)
          @user = u
        end
      end

      if !@user
        render nothing: true, status: :unauthorized
      end
    end
  end

  def parse_request
    #@json = JSON.parse(request.body.read)
    if params[:api_token]
      @api_token = params[:api_token]
    end
  end
end