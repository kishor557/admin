class AddAttachmentImageToProfiles < ActiveRecord::Migration
  def self.up
    change_table :profiles do |t|
      t.attachment :image
    end
  end

  def self.down
    drop_attached_file :profiles, :image
  end
end
