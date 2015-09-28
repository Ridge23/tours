class Asset < ActiveRecord::Base
  belongs_to :asset_type
  belongs_to :paid_condition
  belongs_to :country
  belongs_to :city

  has_attached_file :audio_file
  validates_attachment_content_type :audio_file, :content_type => /.*/

  has_attached_file :text_file
  validates_attachment_content_type :text_file, :content_type => /.*/
end
