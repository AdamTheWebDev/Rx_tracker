class AddAttachmentImageToPrescriptions < ActiveRecord::Migration
  def self.up
    change_table :prescriptions do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :prescriptions, :image
  end
end
