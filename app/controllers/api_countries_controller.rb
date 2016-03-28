class ApiCountriesController < BaseApiController
  def index
    render :json => Country.all.to_json(:include => :city)
  end

  def show
    country = Country.find_by_id(params[:country_id])
    render nothing: true, status: :not_found unless country.present?
  end

end