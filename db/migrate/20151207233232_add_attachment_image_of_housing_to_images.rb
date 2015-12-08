class AddAttachmentImageOfHousingToImages < ActiveRecord::Migration
  def self.up
    change_table :images do |t|
      t.attachment :image_of_housing
    end
  end

  def self.down
    remove_attachment :images, :image_of_housing
  end
end
