class CLI 

    attr_accessor :user


def self.greeting
    puts "It's time to plan your vacation. To get started, enter your name."
    name = gets.chomp
    @user = User.find_or_create_by(name: name)
    plan_or_view
end

def self.newTrip
    puts "Enter the name of your trip"
    tripName = gets.chomp.to_s
    puts "Enter start date (MM-DD)"
    startDate = "2019-" + gets.chomp.to_s
    puts "Enter end date (MM-DD)"
    endDate = "2019-" + gets.chomp.to_s
    @user.create_trip(tripName, startDate, endDate)
end


def self.edit_trip
    puts "Please enter the trip name you would like to edit:"
    tripName = gets.chomp
    userTrip = Trip.find_by(name: tripName)
    if userTrip == [] || userTrip == nil
        puts "That trip doesn't exist"
        edit_trip
    else
        userTrip.display_trip_details
        puts ""
        puts "Would you like to:
        view: See the details of my trip
        change: Change the name
        holiday: See all the holidays to add to your trip
        delete: Delete the trip
        remove: Remove holiday from my trip
        back: See all my trips again"
        option = gets.chomp

        if option == "delete"
            userTrip.delete_my_trip_by_name
            view_or_edit
        elsif option == "change"
            puts "Please enter a new trip name:"
            newTripName = gets.chomp
            @user.update_trip_name(tripName, newTripName)
            edit_trip
        elsif option == "holiday"
            userTrip.holidayOption
            userTrip.display_trip_details
            edit_trip
        elsif option == "back"
            view_or_edit
        elsif option == "view"
            if HolidayTrip.where(trip_id: userTrip.id).size == 0
                puts "You have no holidays planned"
                edit_trip
            else
            edit_trip
            end
        elsif option == "remove"
            userTrip.remove_holiday_from_trip
            edit_trip
        else
            puts "invalid input"
            edit_trip
        end
    end
end


def self.view_or_edit
    if @user.check_my_trip.size == 0
        puts "You have no trips planned."
    else
        @user.display_trips
    end
    puts "Would you like to edit a trip, make a new trip, or go back? (edit/new/back)"
    answer = gets.chomp
    if answer == "new"
        newTrip
        plan_or_view
    elsif answer == "edit"
        edit_trip
    elsif answer == "back"
        plan_or_view
    else
        puts "Not a valid input"
        view_or_edit
    end
end

def self.plan_or_view
    puts "Hi " + @user.name + "."
    action = makeChoice
    if action == "view"
        view_or_edit
        plan_or_view
    elsif action == "plan"
        newTrip
        plan_or_view
    elsif action == "delete"
        Trip.all.each do |t|
            if t.user_id == @user.id
                t.destroy
            end
        end
        plan_or_view
    elsif action == "switch"
        puts "Input user name"
        name = gets.chomp
        @user = User.find_or_create_by(name: name)
        plan_or_view
    else
        puts "Not a valid response"
        plan_or_view
    end 

end

def self.makeChoice
    puts "What would you like to do?
    delete - Delete all your trips
    switch - Switch to a different user
    view - View all your trips
    plan - Plan a new trip "
    action = gets.chomp
    return action
end








end