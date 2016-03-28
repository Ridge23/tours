class ApiAssetsController < BaseApiController
  before_filter :find_asset, only: [:show]#, :update]

  def index
    render json: Asset.all
  end

  def show
    render json: @asset
  end

  private
  def find_asset
    @asset = Asset.find_by_id(params[:asset_id])
    render nothing: true, status: :not_found unless @asset.present?
  end
end