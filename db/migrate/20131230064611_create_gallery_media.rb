class CreateGalleryMedia < ActiveRecord::Migration
  def change
    create_table :gallery_media do |t|
      t.integer :imageable_id
      t.string :imageable_type
      t.integer :medium_id

      t.timestamps
    end

    add_index :gallery_media, :imageable_id
    add_index :gallery_media, :imageable_type
  end
end
