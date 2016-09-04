class AuthController < ApplicationController

  skip_before_action :verify_authenticity_token

  def facebook
    if params[:code].blank?
      render_error "Error with fb"
    else
      access_token = FacebookAuthService.get_access_token(params[:code])
      user_data = FacebookAuthService.get_user_data(access_token)
      user = User.find_by_email(user_data[:email]);
      if !user
        generated_password = Devise.friendly_token.first(8)
        user = User.create!(:email => user_data[:email], :password => generated_password )
        user.first_name = user_data[:first_name]
        user.last_name = user_data[:last_name]
        user.image_url = user_data[:image_url]
        if user_data[:gender] === 'male'
          user.is_female = false
        else
          user.is_female = true
        end
        user.save
      end

      render_success(token: user.authentication_token, id: user_data[:email])
    end
  end

  def google
    if params[:code].blank?
      render_error "Error with google"
    else
      access_token = GoogleAuthService.get_access_token(params[:code])
      user_data = GoogleAuthService.get_user_data(access_token)
      user = User.find_by_email(user_data[:email]);

      if !user
        generated_password = Devise.friendly_token.first(8)
        user = User.create!(:email => user_data[:email], :password => generated_password )
        user.first_name = user_data[:first_name]
        user.last_name = user_data[:last_name]
        user.image_url = user_data[:image_url]
        if user_data[:gender] === 'male'
          user.is_female = false
        else
          user.is_female = true
        end
        user.save
      end

      render_success(token: user.authentication_token, id: user_data[:email])
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
