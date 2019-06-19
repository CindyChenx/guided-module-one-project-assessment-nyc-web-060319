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





Trip.delete_all()
jacklyn = User.all.last
thomas = User.all.first

# puts jacklyn.inspect


trip1 = Trip.create(name: "trip1", start_date: "2019-01-03", end_date: "2019-01-06", user_id: 20)
trip2 = Trip.create(name: "trip2", start_date: "2019-05-05", end_date: "2019-12-12", user_id: 20)
trip3 = Trip.create(name: "trip3", start_date: "2019-06-06", end_date: "2019-11-11", user_id: 1)


# trip1 = jacklyn.create_trip("trip1", "2019-01-01", "2019-10-10")
# #jacklyn.update_trip_name("trip1", "Spring Break")
# puts trip1.inspect

#trip1 = jacklyn.update_trip_dates("trip1", "2020-01-01", "2020-3-10")
# puts trip1.inspect

puts jacklyn.check_my_trip.inspect
puts thomas.check_my_trip.inspect


# jacklyn.delete_all_trips
# puts Trip.all.inspect

# thomas.delete_my_trip_by_name("trip3")
# puts Trip.all.inspect

# puts trip1.search_holidays.size
# puts trip1.return_ch.inspect
# puts trip1.search_countries.inspect
#puts trip1.search_holidays_by_country("United States").inspect
puts trip1.display_holiday("United States").inspect
#jacklyn.add_holiday_to_trip("trip1", "Christmas")


#puts trip1.turn_to_num("2019-05-01")