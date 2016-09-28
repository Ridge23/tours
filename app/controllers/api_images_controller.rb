class ApiImagesController < BaseApiController
  def index
    images = AssetImage.where(:asset_id => params[:asset_id]).all

    images_array = Array.new

    images.each do |image|
      image_hash = Hash.new

      image_hash[:id]          = image.id
      image_hash[:sub]         = image.title
      image_hash[:description] = image.description
      image_hash[:thumb]       = image.image_file.url(:thumb)
      image_hash[:src]         = image.image_file.url

      images_array.append(image_hash)
    end

    render :json => images_array
  end
end