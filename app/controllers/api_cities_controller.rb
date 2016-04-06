class ApiCitiesController < BaseApiController
  def index
    render :json => City.all.to_json(:include => :country)
  end

  def show
    city = City.find_by_id(params[:city_id])
    cityHash = Hash.new
    cityHash[:id] = city.id
    cityHash[:name] = city.name

    assets = Asset.where(:city_id => city.id).all
    cityHash[:assets] = assets

    render :json => cityHash.to_json
  end

end