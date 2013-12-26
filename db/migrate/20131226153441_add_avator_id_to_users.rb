class AddAvatorIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :avator_id, :integer
  end
end
