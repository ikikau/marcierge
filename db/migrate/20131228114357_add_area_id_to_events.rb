class AddAreaIdToEvents < ActiveRecord::Migration
  def change
    add_column :events, :area_id, :integer
  end
end
