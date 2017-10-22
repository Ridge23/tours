class ApiMediaController < BaseApiController
  skip_before_filter :verify_authenticity_token

  def index
    media = AssetMedia.where(:asset_id => params[:asset_id]).order("position ASC").all

    media_array = Array.new

    media.each do |media_item|
      media_item_hash = Hash.new


      media_item_hash[:id] =  media_item.hash
      media_item_hash[:title] = media_item.title
      media_item_hash[:description] =  media_item.description
      media_item_hash[:audio_file_file_name] = media_item.media_file_file_name
      media_item_hash[:audio_file_url]       = media_item.media_file.url
      media_item_hash[:audio_file_duration]  = media_item.media_duration

      media_array.append(media_item_hash)
    end

    render :json => media_array
  end

  def create
    media = AssetMedia.new

    media.asset_id = params[:asset_id]
    media.title = params[:media][:title]
    media.description = params[:media][:description]
    media.media_from_url(params[:media][:media_url])

    media.save

    render :json => media
  end

end