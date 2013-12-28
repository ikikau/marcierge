class AddThumbnailIdToEvents < ActiveRecord::Migration
  def change
    add_column :events, :thumbnail_id, :integer
  end
end
