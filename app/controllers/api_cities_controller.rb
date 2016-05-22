class ApiCitiesController < BaseApiController
  def index
    render :json => City.all.to_json(:include => :country)
  end

  def show
    city = City.find_by_id(params[:city_id])
    cityHash = Hash.new
    cityHash[:id] = city.id
    cityHash[:name] = city.name
    cityHash[:assets] = []

    assets = Asset.where(:city_id => city.id).all
    assets.each do |asset|
      assetHash = Hash.new
      assetHash[:id] = asset.id
      assetHash[:name] = asset.name
      assetHash[:text_file_file_name] = asset.text_file_file_name
      assetHash[:audio_file_file_name] = asset.audio_file_file_name
      assetHash[:thumbnail] = asset.thumbnail.url(:thumb)
      cityHash[:assets].push(assetHash)
    end

    render :json => cityHash.to_json
  end

end