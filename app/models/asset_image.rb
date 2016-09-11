class AssetImage < ActiveRecord::Base
  belongs_to :asset

  has_attached_file :image_file, :required => false, :styles => { :medium => "300x300#", :thumb => "200x200#" }
  validates_attachment_content_type :image_file, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
end