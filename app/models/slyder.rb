class Slyder < ActiveRecord::Base
  has_attached_file :poster, :styles => { large:"1024x360!", small:"512x180!"}
  validates_attachment_content_type :poster, :content_type => /\Aimage\/.*\Z/
end
