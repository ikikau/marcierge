class AddPrefectureIdToEvents < ActiveRecord::Migration
  def change
    add_column :events, :prefecture_id, :integer
    add_index :events, :prefecture_id
  end
end
