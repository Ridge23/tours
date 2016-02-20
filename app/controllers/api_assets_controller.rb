class ApiAssetsController < BaseApiController
  before_filter :find_asset, only: [:show]#, :update]

  # before_filter only: :create do
  #   unless @json.has_key?('project') && @json['project'].responds_to?(:[]) && @json['project']['name']
  #     render nothing: true, status: :bad_request
  #   end
  # end
  #
  # before_filter only: :update do
  #   unless @json.has_key?('project')
  #     render nothing: true, status: :bad_request
  #   end
  # end
  #
  # before_filter only: :create do
  #   @project = Asset.find_by_name(@json['project']['name'])
  # end

  def index
    render json: Asset.all
  end

  def show
    render json: @asset
  end

  # def create
  #   if @project.present?
  #     render nothing: true, status: :conflict
  #   else
  #     @project = Asset.new
  #     @project.assign_attributes(@json['project']
  #     if @project.save
  #       render json: @project
  #     else
  #       render nothing: true, status: :bad_request
  #     end
  #   end
  # end
  #
  # def update
  #   @project.assign_attributes(@json['project'])
  #   if @project.save
  #     render json: @project
  #   else
  #     render nothing: true, status: :bad_request
  #   end
  # end

  private
  def find_asset
    @asset = Asset.find_by_id(params[:asset_id])
    render nothing: true, status: :not_found unless @asset.present?
  end
end