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
        puts "Here are your trips:"
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

end