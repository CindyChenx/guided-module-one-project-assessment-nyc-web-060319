require_relative "../lib/models/holiday.rb"
require_relative "../Seeding_Stuff/populate_hol_db.rb"
require_relative "../lib/data/Country_names_ISOs_hash.rb"
require_relative "../lib/data/seeds_prototype_holidayscountries.rb"

#add holidays to db
holidayArray = getHolidays(HOLIDAYS_OF_THE_WORLD)
holidayArray.each do |hash|
  name = hash[:name]
  description = hash[:description]
  date = hash[:date]
  type = hash[:type]
  Holiday.find_or_create_by(name: name, description: description, date: date, type_of_holiday: type)
end

#add the countries to db
COUNTRY_NAMES.each do |key, value|
  Country.find_or_create_by(name: value, country_code: key )
end

#create holiday and country join table
seed_array = find_country_holiday_pairs(HOLIDAYS_OF_THE_WORLD)
populate_db_holidays_countries(seed_array)



#add users to db
names = ["Carita", "Zachariah", "Magaret", "Chrissy", "Burton", "Rachelle","Agnus","Wilton",
  "Nichelle","Charis","Sharleen","Cinda","Jacquline","Luna","Floy","Noreen","Bee","Margy","Ivy","Jacelyn"]
for counter in 0..19 do
  User.find_or_create_by(name: names[counter])
end



