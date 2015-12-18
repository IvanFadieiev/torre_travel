class AddAttachmentPosterToSlyders < ActiveRecord::Migration
  def self.up
    change_table :slyders do |t|
      t.attachment :poster
    end
  end

  def self.down
    remove_attachment :slyders, :poster
  end
end
