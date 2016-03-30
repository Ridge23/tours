class ApiCountriesController < BaseApiController
  def index
    response_array = []
    countries = Country.all
    countries.each do |country|
      if country.enabled === true
        countryHash = Hash.new
        countryHash[:id] = country.id
        countryHash[:name] = country.name
        countryHash[:enabled] = country.enabled
        countryHash[:city] = []
        country.city.each do |city|
          if city.enabled === true
            cityHash = Hash.new
            cityHash[:id] = city.id
            cityHash[:name] = city.name
            cityHash[:enabled] = city.enabled
            cityHash[:needs_payment] = false
            cityHash[:has_text] = false
            cityHash[:has_audio] = false
            assets = Asset.where(:city_id => city.id).all
            if assets
              assets.each do |asset|
                if asset.paid_condition.title != 'Free'
                  cityHash[:needs_payment] = true
                end
                if asset.asset_type.title == 'Audio' || asset.asset_type.title == 'Text/Audio'
                  cityHash[:has_audio] = true
                end
                if asset.asset_type.title == 'Text' || asset.asset_type.title == 'Text/Audio'
                  cityHash[:has_text] = true
                end
              end
            end
            countryHash[:city].push(cityHash)
          end
        end
        response_array.push(countryHash)
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