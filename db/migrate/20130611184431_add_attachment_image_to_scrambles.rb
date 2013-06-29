class AddAttachmentImageToScrambles < ActiveRecord::Migration
  def self.up
    change_table :scrambles do |t|
      t.attachment :image
    end
  end

  def self.down
    drop_attached_file :scrambles, :image
  end
end
