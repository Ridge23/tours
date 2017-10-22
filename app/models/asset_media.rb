class AssetMedia < ActiveRecord::Base
  acts_as_list

  belongs_to :asset

  has_attached_file :media_file, :required => true
  validates_attachment_content_type :media_file, :content_type => ["audio/mpeg", "audio/mp3", "audio/x-aiff", "audio/aiff", "audio/wav", "audio/x-wav", "audio/aac", "audio/mp4", "audio/mpeg4-generic", "audio/MP4A-LATM", "audio/aacp", "application/m4a", "audio/3gpp", "audio/3gpp2", "application/aac", "audio/x-m4a"]

  before_create :set_duration
  before_save :set_duration

  def media_from_url(url)
    self.media_file = URI.parse(url).open
  end

  private
    def set_duration
      if media_file.queued_for_write[:original]
        TagLib::FileRef.open(media_file.queued_for_write[:original].path) do |fileref|
          unless fileref.null?
            properties = fileref.audio_properties
            @length = properties.length
          end
        end
      end

      self.media_duration = @length
    end

end