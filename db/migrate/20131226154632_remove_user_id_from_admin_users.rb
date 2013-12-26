class RemoveUserIdFromAdminUsers < ActiveRecord::Migration
  def change
    remove_column :admin_users, :user_id
  end
end
