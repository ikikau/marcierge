class AddAttachmentAssetToMedia < ActiveRecord::Migration
  def self.up
    change_table :media do |t|
      t.attachment :asset
    end
  end

  def self.down
    drop_attached_file :media, :asset
  end
end
