class RenameAdminsToAdminUsers < ActiveRecord::Migration
  def change
    rename_table :admins, :admin_users
  end
end
