class CreateHolidayTrips < ActiveRecord::Migration[5.2]
  def change
    create_table :holiday_trips do |t|
      t.integer :holiday_id
      t.integer :trip_id
    end
  end
end
