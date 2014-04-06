class RemoveCreatorIdFromEvent < ActiveRecord::Migration
  def up
    remove_column :events, :creator_id
  end

  def down
    add_column :events, :creator_id, :integer
  end
end
