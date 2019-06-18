require_relative "../lib/models/holiday.rb"
require_relative "../Seeding_Stuff/populate_hol_db.rb"
require_relative "../lib/data/Country_names_ISOs_hash.rb"

holidayArray = getHolidays(HOLIDAYS_OF_THE_WORLD)
#puts holidayArray.inspect

holidayArray.each do |hash|
  name = hash[:name]
  description = hash[:description]
  date = hash[:date]
  type = hash[:type]
  Holiday.create(name: name, description: description, date: date, type_of_holiday: type)
end

COUNTRY_NAMES.each do |key, value|
  Country.create(name: value, country_code: key )
end
