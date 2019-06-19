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
	# prior_holiday = 0 
	# holiday_id_for_db = nil
	# 	array.each_with_index do |element, elements_index|
	# 		#puts "Running index 0..24.   Current index is:  #{elements_index}"
	# 		if elements_index % 2 == 0
	# 			country_id_for_db = Country.where(:country_code => "#{element}")[0].id 		#was just [0].id
	# 		else 
	# 			#puts "TESTING IF STATEMENT : Element is: #{element} & prior_holiday is #{prior_holiday}"
	# 			if element != holiday_id		# was if element != holiday_id.. 
	# 				#puts "Element is: #{element} & prior_holiday is #{prior_holiday}"
	# 				#puts "prior_holiday is #{prior_holiday} & holiday_id_for_db is #{holiday_id_for_db} !"
	# 				holiday_id_for_db = Holiday.where(:name => "#{element}")[0].id
	# 				prior_holiday = element
	# 				#puts "holiday_id_for_db is : #{holiday_id_for_db}"
	# 				CountryHoliday.create(country_id: country_id_for_db, holiday_id: holiday_id_for_db )
	# 			end
	# 		end
	# 	end
	# end
	# seed_array = find_country_holiday_pairs(HOLIDAYS_OF_THE_WORLD)
	# populate_db_holidays_countries(seed_array)





# jacklyn = User.all.last

# puts jacklyn.inspect


# #trip1 = Trip.create(name: "trip1", start_date: "2019-01-01", end_date: "2019-10-10", user_id: 20)
# trip1 = jacklyn.create_trip("trip1", "2019-01-01", "2019-10-10")
# #jacklyn.update_trip_name("trip1", "Spring Break")
# puts trip1.inspect

