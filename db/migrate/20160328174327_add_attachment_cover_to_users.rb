class AddAttachmentCoverToUsers < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :image, :users
  end
end
