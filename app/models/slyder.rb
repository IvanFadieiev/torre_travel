class Slyder < ActiveRecord::Base
  has_attached_file :poster, :styles => { large:"1280x360!", small:"512x144!"}
  validates_attachment_content_type :poster, :content_type => /\Aimage\/.*\Z/
end
