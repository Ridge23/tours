class ApiCountriesController < BaseApiController
  def index
    response_array = []
    countries = Country.all
    countries.each do |country|
      if country.enabled === true
        country_hash = Hash.new
        country_hash[:id] = country.id
        country_hash[:name] = country.name
        country_hash[:enabled] = country.enabled
        country_hash[:city] = []
        country.city.each do |city|
          if city.enabled === true
            city_hash = Hash.new
            city_hash[:id] = city.id
            city_hash[:name] = city.name
            city_hash[:enabled] = city.enabled
            city_hash[:needs_payment] = false
            city_hash[:has_text] = false
            city_hash[:has_audio] = false
            assets = Asset.where(:city_id => city.id).all
            if assets
              assets.each do |asset|
                if asset.paid_condition.title != 'Free'
                  city_hash[:needs_payment] = true
                end
                if asset.asset_type.title == 'Audio' || asset.asset_type.title == 'Text/Audio'
                  city_hash[:has_audio] = true
                end
                if asset.asset_type.title == 'Text' || asset.asset_type.title == 'Text/Audio'
                  city_hash[:has_text] = true
                end
              end
            end
            country_hash[:city].push(city_hash)
          end
        end
        response_array.push(country_hash)
      end
    end
    #render :json => Country.all.to_json(:include => :city)
    render :json => response_array.to_json
  end

  def show
    country = Country.find_by_id(params[:country_id])
    render nothing: true, status: :not_found unless country.present?
  end

end