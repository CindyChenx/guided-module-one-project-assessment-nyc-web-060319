class User < ActiveRecord::Base
    has_many :trips
    

    # instantiate and save a new user
    def create_user(user_name)

        user = User.new 
        user.name = user_name 
        user.save

    end

    # user creates a trip
    def create_trip(trip_name, start_date, end_date)

        Trip.create do |trip|
            trip.name = trip_name
            trip.start_date = start_date
            trip.end_date = end_date
            trip.user_id = self.id
        end
    
    end

    # user changes trip name
    def update_trip_name(old_trip_name, new_trip_name)
        myTrips = self.check_my_trip
        myTrips.find do |t|
            t.name == old_trip_name
        end.update(name: new_trip_name)
    
       # trip
    
    end

    # user changes trip dates
    def update_trip_dates(trip_name, new_start_date, new_end_date)

        trip = Trip.find_by(name: trip_name)
        trip.update(start_date: new_start_date)
        trip.update(end_date: new_end_date)
        trip.save
        trip

    end

    # user checks all his trips
    def check_my_trip 

        Trip.all.select do |trip|
            trip.user == self 
        end

    end

    def display_trips
        check_my_trip.each do |t|
            puts t.name + " , from " + t.start_date + " to " + t.end_date
        end
    end

    # user deletes all his trips
    def delete_all_trips

        Trip.all.each do |trip|
           if trip.user == self
            trip.destroy
           end
        end

    end

    # user deletes trip by name
    def delete_my_trip_by_name (trip_name)

        Trip.find_by(name: trip_name).destroy
        
    end



    # # user checks holidays in his trip
    # def check_holidays(trip_name)

    #     my_trip_list = HolidayTrip.all.select do |x|
    #         x.trip_name == trip_name
    #     end

    #     my_trip_list.all.map do |x|
    #         x.holiday
    #     end

    # end

    # # user searches for holidays by country
    # def search_holiday_by_country(country_name)

    #     country_list = CountryHoliday.all.select do |x|
    #         x.country == country_name
    #     end

    #     country_list.all.map do |y|
    #         y.holiday
    #     end

    # end

    # # user searches for countries by holiday
    # def search_country_by_holiday(holiday_name)

    #     holiday_list = CountryHoliday.all.select do |x|
    #         x.holiday == holiday_name 
    #     end

    #     holiday_list.all.map do |y|
    #         y.country
    #     end

    # end

end