class ApiCitiesController < BaseApiController
  def index
    render :json => City.all.to_json(:include => :country)
  end

  def show
    city = City.find_by_id(params[:city_id])
    city_hash = Hash.new
    city_hash[:id] = city.id
    city_hash[:name] = city.name
    city_hash[:assets] = []

    assets = Asset.where(:city_id => city.id).all
    assets.each do |asset|
      asset_hash                        = Hash.new
      asset_hash[:id]                   = asset.id
      asset_hash[:name]                 = asset.name
      asset_hash[:text_file_file_name]  = asset.text_file_file_name
      asset_hash[:audio_file_file_name] = asset.audio_file_file_name
      asset_hash[:thumbnail]            = asset.thumbnail.url(:thumb)
      city_hash[:assets].push(asset_hash)
    end

    render :json => city_hash.to_json
  end

end