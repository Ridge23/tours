class AuthController < ApplicationController

  skip_before_action :verify_authenticity_token

  def facebook
    if params[:code].blank?
      render_error "Error with fb"
    else
      access_token = FacebookAuthService.get_access_token(params[:code])
      user_data = FacebookAuthService.get_user_data(access_token)
      render_success(token: 'opana', id: user_data[:email])
    end
  end

  def render_data(data, status)
    render json: data, status: status, callback: params[:callback]
  end

  def render_error(message, status = :unprocessable_entity)
    render_data({ error: message }, status)
  end

  def render_success(data, status = :ok)
    if data.is_a? String
      render_data({ message: data }, status)
    else
      render_data(data, status)
    end
  end

end
