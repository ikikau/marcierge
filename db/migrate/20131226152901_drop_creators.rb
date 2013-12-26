class DropCreators < ActiveRecord::Migration
  def change
    drop_table :creators
  end
end
