class Asset < ActiveRecord::Base
  belongs_to :asset_type
  belongs_to :paid_condition
  belongs_to :country
  belongs_to :city

  has_attached_file :audio_file
  validates_attachment_content_type :audio_file, :content_type => ["application/mp3", "application/x-mp3", "audio/mpeg", "audio/mp3"]

  has_attached_file :thumbnail, :required => false, :styles => { :medium => "300x300#", :thumb => "200x200#" }

  before_save do
    self.audio_file_url = self.audio_file.url
  end

end
