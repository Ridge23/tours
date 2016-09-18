class ApiImagesController < BaseApiController
  def index
    render :json => AssetImage.where(:asset_id => params[:asset_id]).all
  end
end