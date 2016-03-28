class ApiCitiesController < BaseApiController
  def index
    render :json => City.all.to_json(:include => :country)
  end

  def show
    city = City.find_by_id(params[:city_id])
    render nothing: true, status: :not_found unless city.present?
  end

end