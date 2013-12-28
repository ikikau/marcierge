class AddHolidayToEventDates < ActiveRecord::Migration
  def change
    add_column :event_dates, :holiday, :boolean
  end
end
