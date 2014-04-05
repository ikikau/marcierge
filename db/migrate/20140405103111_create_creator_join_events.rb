class CreateCreatorJoinEvents < ActiveRecord::Migration
  def change
    create_table :creator_join_events do |t|
      t.integer :creator_id
      t.integer :event_id
      t.datetime :join_at

      t.timestamps
    end

    add_index :creator_join_events, :creator_id
    add_index :creator_join_events, :event_id
  end
end
