require_relative '../config/environment'
require_relative '../Seeding_Stuff/populate_hol_db.rb'
require_relative "../lib/data/seeds_prototype_holidayscountries.rb"
require_relative './interface_controller.rb'

# holidayArray = getHolidays(HOLIDAYS_OF_THE_WORLD)
# # i = 0
# # while i < holidayArray.length
# #   puts holidayArray[i].inspect
# #   i += 50
# # end
# puts holidayArray.last.inspect


	# 	Code to test populate Country<>Holiday join table - Works! 
	# def populate_db_holidays_countries(array)
	# country_id_for_db = nil
	# holiday_id_for_db = nil
	# 	array.each_with_index do |element, elements_index|
	# 		if elements_index % 2 == 0
	# 			country_id_for_db = Country.where(:country_code => "#{element}")[0].id
	# 		else 
	# 			if element != holiday_id_for_db 
	# 				holiday_id_for_db = Holiday.where(:name => "#{element}")[0].id
	# 				CountryHoliday.create(country_id: country_id_for_db, holiday_id: holiday_id_for_db )
	# 			end
	# 		end
	# 	end
	# end
	# seed_array = find_country_holiday_pairs(HOLIDAYS_OF_THE_WORLD)
	# populate_db_holidays_countries(seed_array[0..24])





# jacklyn = User.all.last

# puts jacklyn.inspect


# #trip1 = Trip.create(name: "trip1", start_date: "2019-01-01", end_date: "2019-10-10", user_id: 20)
# trip1 = jacklyn.create_trip("trip1", "2019-01-01", "2019-10-10")
# #jacklyn.update_trip_name("trip1", "Spring Break")
# puts trip1.inspect

