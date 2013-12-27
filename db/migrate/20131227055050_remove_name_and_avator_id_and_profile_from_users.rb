class RemoveNameAndAvatorIdAndProfileFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :name
    remove_column :users, :avator_id
    remove_column :users, :profile

    add_column :users, :creator_id, :integer
  end
end
