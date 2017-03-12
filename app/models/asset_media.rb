class AssetMedia < ActiveRecord::Base
  belongs_to :asset

  has_attached_file :media_file, :required => true
  validates_attachment_content_type :media_file, :content_type => ["audio/mpeg", "audio/mp3", "audio/x-aiff", "audio/aiff", "audio/wav", "audio/x-wav", "audio/aac", "audio/mp4", "audio/mpeg4-generic", "audio/MP4A-LATM", "audio/aacp", "application/m4a", "audio/3gpp", "audio/3gpp2", "application/aac", "audio/x-m4a"]
end