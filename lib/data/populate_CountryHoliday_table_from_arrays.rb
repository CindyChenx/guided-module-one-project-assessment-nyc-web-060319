# To populate CountryHoliday Table
# Loop through array of pairs of holiday name + country code, 
# Look up id for each in DB, 
# Then create new row in join table
# !!! Need to rename this to match ActiveRecord rules. 

require_relative '../config/environment'

			seed_array = find_country_holiday_pairs

			holiday_id_for_db = Holiday.where(:name => ARRAY EVEN).first.id

			# add logic to check is ARRAY ODD =/= country_id_for_db before search DB again
			country_id_for_db = Country.where(:ISO JAWN => ARRAY ODD).first.id

			CountryHoliday.create(:country_id => country_id_for_db, :holiday_id => holiday_id_for_db )
