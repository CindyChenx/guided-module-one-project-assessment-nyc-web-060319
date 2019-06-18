class PopulateCountryHoliday

	#require_relative './data_structure_to_parse.rb'
	# require_relative './example_data.rb'
	# require_relative './populate_CountryHoliday_table_from_arrays.rb'	
	require 'pry'

	# populate join table.  Holidays <> Countries. 
	# For each country, for each holiday, 
	# find holiday Table's id for the holiday, 
	# find country Table's id for the country, 
	# create a new row in the join table - CountryHoliday

	# go through 

	def find_country_holiday_pairs(data)
		all_array = []

		data.each do |country, server_replies|		#CountryHoliday.create(country_id: , holiday_id: )
			server_replies.each do |server_reply, server_datas| #server_datas = holidays
				if server_reply == "response"
					server_datas.each do |holiday_key, holiday_values |
						holiday_values.each do |holiday_array_element|
							holiday_array_element.each do |holiday_hash, holiday_datas| #was holiday_values[0]
								if holiday_hash == "name"
										all_array << country
										all_array << holiday_datas
										#puts "Holiday_datas is : #{holiday_datas},  country is: #{country}"	
					
								end
							end
						end
					end
				end
			end
		end
		puts all_array
	end





	seed_array = find_country_holiday_pairs(_data_)
	puts "Seed Array is  :  #{seed_array}"

	seed_array.each_with_index do |elements_index|
		if elements_index % 2 == 1
			country_id_for_db = Country.where(:country_code => elements_index).first.id
		else 
			holiday_id_for_db = Holiday.where(:name => elements_index).first.id
			CountryHoliday.create(:country_id => country_id_for_db, :holiday_id => holiday_id_for_db )
		end
	end
	

	# 	# add logic to check is ARRAY ODD =/= country_id_for_db before search DB again
	# country_id_for_db = Country.where(:ISO JAWN => ARRAY ODD).first.id








end #End class