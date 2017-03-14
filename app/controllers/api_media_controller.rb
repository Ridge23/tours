class ApiMediaController < BaseApiController
  def index
    media = AssetMedia.where(:asset_id => params[:asset_id]).all

    media_array = Array.new

    media.each do |med|
      med_hash = Hash.new


      med_hash[:id] =  med.hash
      med_hash[:title] = med.title
      med_hash[:description] =  med.description
      med_hash[:audio_file_file_name] = med.media_file_file_name
      med_hash[:audio_file_url]       = med.media_file.url
      med_hash[:audio_file_duration]  = med.media_duration

      media_array.append(med_hash)
    end

    render :json => media_array
  end
end