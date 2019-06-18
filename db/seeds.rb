require_relative "../lib/models/holiday.rb"
require_relative "../Seeding_Stuff/populate_hol_db.rb"
require_relative "../lib/data/seeds_prototype_holidayscountries.rb"


seed_array = find_country_holiday_pairs(HOLIDAYS_OF_THE_WORLD)
populate_db_holidays_countries(seed_array[0..24])

# holidayArray = getHolidays(HOLIDAYS_OF_THE_WORLD)

# puts holidayArray.inspect

# holidayArray.each do |hash|
#   name = hash[:name]
#   description = hash[:description]
#   date = hash[:date]
#   type = hash[:type]
#   Holiday.create(name: name, description: description, date: date, type_of_holiday: type)
# end
