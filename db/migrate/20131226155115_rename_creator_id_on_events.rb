class RenameCreatorIdOnEvents < ActiveRecord::Migration
  def change
    rename_column :events, :creator_id, :user_id
  end
end
