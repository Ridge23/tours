require 'taglib'

class Asset < ActiveRecord::Base
  attr_writer :remove_audio

  belongs_to :asset_type
  belongs_to :paid_condition
  belongs_to :country
  belongs_to :city

  has_attached_file :audio_file
  validates_attachment_content_type :audio_file, :content_type => ["application/mp3", "application/x-mp3", "audio/mpeg", "audio/mp3", "audio/m4a"]

  has_attached_file :thumbnail, :required => false, :styles => { :medium => "300x300#", :thumb => "200x200#" }

  before_save do
    self.audio_file_url = self.audio_file.url

    if audio_file.queued_for_write[:original]
      TagLib::FileRef.open(audio_file.queued_for_write[:original].path) do |fileref|
        unless fileref.null?
          properties = fileref.audio_properties
          @length = properties.length
        end
      end
    end

    self.audio_duration = @length
  end

  def remove_audio
    @remove_audio || false
  end

  before_validation { self.audio_file.clear if self.remove_audio == '1' }

end
