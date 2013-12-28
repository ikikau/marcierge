class AddWeekdayToEventDates < ActiveRecord::Migration
  def change
    add_column :event_dates, :weekday, :boolean
    add_index :event_dates, :weekday
  end
end
