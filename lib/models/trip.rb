class Trip < ActiveRecord::Base
    has_many :holidaytrips
    has_many :holidays, through: :holidaytrips
    belongs_to :user


    # helper method 
    def turn_to_num(date)
        return (date[0..3] + date[5..6] + date[8..9]).to_i
    end

    # user searches for holidays in the trip's date range
    def search_holidays

        start_day = turn_to_num(self.start_date)
        end_day = turn_to_num(self.end_date)

        Holiday.all.select do |hol|
            turn_to_num(hol.date) >= start_day && turn_to_num(hol.date) <= end_day
        end

    end

    def display_holidays

        puts (search_holidays.map do |holiday|
            holiday.name
        end.join(", "))

    end

    # CountryHoliday table by date range
    def return_ch
        answer = []
        search_holidays.each do |hol|
            CountryHoliday.all.each do |ch|
                    if hol.id == ch.holiday_id
                        answer << ch
                    end
            end
        end
        return answer
    end

    # country has holidays on the trip date range
    def search_countries
       countries = []
       return_ch.each do |ch|
            rightCountry = Country.all.find do |co|
                co.id == ch.country_id
            end
            countries << rightCountry.name     
         end
         return countries.uniq
     end

    def display_countries
       string = search_countries.join(", ")
    
       puts string
    end

     # available holidays in that country
     def search_holidays_by_country(country_name)
        chs = return_ch.select do |ch|
            ch.country_id == Country.find_by(name: country_name).id
        end
        hols = []
        chs.each do |ch|
            Holiday.all.each do |hol|
                if ch.holiday_id == hol.id
                    hols << hol
                end
            end
        end
        return hols
    end
        

    def display_holiday_by_country(country_name)
        holidayHash = {}
        hols = self.search_holidays_by_country(country_name)
        hols.each do |hol|
            holidayHash[hol.id] = {name: hol.name, description: hol.description, type: hol.type_of_holiday, id: hol.id, date: hol.date}
        end
        return holidayHash
    end


    def display_countries_by_holiday(holiday_name)
        hol = Holiday.find_by(name: holiday_name)
        chs = CountryHoliday.where(holiday_id: hol.id)
        chs.all.each do |ch|
            puts Country.where(id: ch.country_id)[0].name + ", " + Holiday.find(ch.holiday_id).date
        end
        return hol
    end 


    # user adds a country to his trip
    def selectCountry(hol)
        puts "Select a country to add to your trip"
        countryName = gets.chomp
        c = Country.find_by(name: countryName)
        # puts c.inspect 
        # puts "puts c[0] is #{c[0]}"
        # puts "At line 105 ^"
        if c == nil || c == [] #|| c[0] == nil 
            puts "Input a valid country"
            self.selectCountry(hol)
        else
            # puts hol.id.inspect
            # puts self.inspect
            # puts c.id
            # puts c
            HolidayTrip.create(holiday_id: hol.id, trip_id: self.id, country_id: c.id)
        end
    end



    def remove_holiday_from_trip
        holTrip = HolidayTrip.find_by(trip_id: self.id)
        if holTrip == nil
            puts "There are no holidays in your trip"
        else
            puts "Choose the holiday you want to delete from your trip:"
            delete_holiday_name = gets.chomp
          
            h = Holiday.find_by(name: delete_holiday_name)
            if h == nil || h == []
                puts "Input a valid holiday name"
                self.remove_holiday_from_trip
            else
                HolidayTrip.where(trip_id: self.id, holiday_id: h.id)[0].destroy
                self.display_trip_details
            end
        end
            
    end

    # user checks details in his trip
    def display_trip_details
        puts "Here are your trip details:"
        allTrips = HolidayTrip.where(trip_id: self.id)
        allTrips.each do |holTrip|
            hol = Holiday.find(holTrip.holiday_id)
            conHol = CountryHoliday.find_by(holiday_id: hol.id)
            # con = Country.find(conHol.country_id)
            con = Country.find(holTrip.country_id)
            # puts "con is:  #{con}"
            # puts con.inspect
            puts "holTrip.country_id is #{holTrip.country_id}"
            puts hol.name + ", on " +  hol.date + ", in " + (con.name ||= 1)
        end


    end

    def delete_my_trip_by_name
        Trip.find(self.id).destroy
    end

    def holidayOption   #called by userTrip no dupls in Holiday! 
        puts self.display_holidays
        puts "Choose a holiday by name:"
        holiday_name = gets.chomp
        h  = Holiday.find_by(name: holiday_name)
        if h == nil || h == [] #|| h[0] == nil
            puts "Input a valid holiday"
            self.holidayOption
        else
            holidayChosen = self.display_countries_by_holiday(holiday_name)
            self.selectCountry(holidayChosen)
        end
    end



end