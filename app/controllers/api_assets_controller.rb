class ApiAssetsController < BaseApiController
  before_filter :find_asset, only: [:show] #, :update]

  def index
    render json: Asset.all
  end

  def show
    render json: @asset
  end

  private
  def find_asset
    asset                             = Asset.find_by_id(params[:asset_id])
    asset_hash                        = Hash.new
    asset_hash[:id]                   = asset.id
    asset_hash[:name]                 = asset.name
    asset_hash[:text_file_file_name]  = asset.text_file_file_name
    asset_hash[:text_file_url]        = asset.text_file_url
    asset_hash[:audio_file_file_name] = asset.audio_file_file_name
    asset_hash[:audio_file_url]       = asset.audio_file_url
    asset_hash[:thumbnail_url]        = asset.thumbnail.url(:thumb)
    asset_hash[:thumbnail_file_name]  = asset.thumbnail.original_filename
    @asset                            = asset_hash
    render nothing: true, status: :not_found unless @asset.present?
  end
end