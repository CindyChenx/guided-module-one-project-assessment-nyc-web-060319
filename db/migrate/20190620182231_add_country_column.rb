class AddCountryColumn < ActiveRecord::Migration[5.2]
  def change
    add_column :holiday_trips, :country_id, :string
  end
end
