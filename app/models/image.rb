class Image < ActiveRecord::Base
  belongs_to :torre_travel
  has_attached_file :image_of_housing, :styles => { :large =>"640x480>", :medium => "300x300>", :small => "256x192!" }
  validates_attachment_content_type :image_of_housing, :content_type => /\Aimage\/.*\Z/
end