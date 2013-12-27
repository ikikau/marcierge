class RemoveNameAndAvatorIdAndProfileFromUsers < ActiveRecord::Migration
  def change
    add_column :users, :creator_id, :integer
  end
end
