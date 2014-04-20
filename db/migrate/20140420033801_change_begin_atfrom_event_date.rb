class ChangeBeginAtfromEventDate < ActiveRecord::Migration
  def up
    change_column :event_dates, :begin_at, :datetime, null: true
  end

  def down
    change_column :event_dates, :begin_at, :datetime, null: false
  end
end
