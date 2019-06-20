#require_relative "../lib/models/countryholiday.rb"
#require_relative "../Seeding_Stuff/populateCountryHoliday.rb"

# use .inspect on a file? 
# PASTE IN ALL DATA !!! (@ top of this file)
# move files to Seeding Stuff




	def find_country_holiday_pairs(data)
		all_array = []

		data.each do |country, server_replies|							#CountryHoliday.create(country_id: , holiday_id: )
			server_replies.each do |server_reply, server_datas| 		#server_datas = holidays
				if server_reply == "response"
					server_datas.each do |holiday_key, holiday_values |
						holiday_values.each do |holiday_array_element|
							holiday_array_element.each do |holiday_hash, holiday_datas| 
								if holiday_hash == "name"
										all_array << country
										all_array << holiday_datas					
								end
							end
						end
					end
				end
			end
		end
		return all_array
	end




	# seed_array = find_country_holiday_pairs(holidays_of_the_world)




	# holidays_of_the_world = US only to test



	def populate_db_holidays_countries(array)
	country_id_for_db = nil
	holiday_id_for_db = nil
		array.each_with_index do |element, elements_index|
			if elements_index % 2 == 0
				country_id_for_db = Country.where(:country_code => "#{element}")[0].id
			else 
				if element != holiday_id_for_db 
					holiday_id_for_db = Holiday.where(:name => "#{element}")[0].id
					if CountryHoliday.where(country_id: country_id_for_db,  holiday_id: holiday_id_for_db) == []
						CountryHoliday.create(country_id: country_id_for_db, holiday_id: holiday_id_for_db )
					end
				end
			end
		end
	end





