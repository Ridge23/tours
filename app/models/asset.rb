require 'taglib'

class Asset < ActiveRecord::Base
  attr_writer :remove_audio

  belongs_to :asset_type
  belongs_to :paid_condition
  belongs_to :country
  belongs_to :city

  has_attached_file :audio_file
  validates_attachment_content_type :audio_file, :content_type => ["audio/mpeg", "audio/mp3", "audio/x-aiff", "audio/aiff", "audio/wav", "audio/x-wav", "audio/aac", "audio/mp4", "audio/mpeg4-generic", "audio/MP4A-LATM", "audio/aacp", "application/m4a", "audio/3gpp", "audio/3gpp2", "application/aac", "audio/x-m4a"]

  has_attached_file :thumbnail, :required => false, :styles => { :medium => "300x300#", :thumb => "200x200#" }

  before_save :set_duration
  before_create :set_duration

  def remove_audio
    @remove_audio || false
  end

  private
    def set_duration
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

  before_validation { self.audio_file.clear if self.remove_audio == '1' }

end
