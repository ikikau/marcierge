class CreateEventDates < ActiveRecord::Migration
  def change
    create_table :event_dates do |t|
      t.integer :event_id, null: false
      t.datetime :begin_at, null: false
      t.datetime :end_at

      t.timestamps
    end

    add_index :event_dates, :event_id
  end
end
