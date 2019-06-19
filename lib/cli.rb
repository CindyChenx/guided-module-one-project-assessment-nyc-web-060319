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

    puts "Would you like to:
    delete: Delete the trip
    change: Change the name
    country: See countries with holidays
    holiday: See all the holidays
    back: See my trips again"

    option = gets.chomp

    if option == "delete"
        delete_my_trip_by_name(tripName)
    elsif option == "change"
        puts "Please enter a new trip name:"
        newTripName = gets.chomp
        @user.update_trip_name(tripName, newTripName)
    elsif option == "country"
        userTrip.display_countries
    elsif option == "holiday"
        puts userTrip.display_holidays
    elsif option == "back"
        view_or_edit
    else
        puts "invalid input"
        edit_trip
    end

end

def self.view_or_edit
    if @user.check_my_trip.size == 0
        puts "You have no trips planned."
    else
        @user.display_trips
    end
    puts "Would you like to edit a trip or make a new trip? (edit/new)"
    answer = gets.chomp
    if answer == "new"
        newTrip
        plan_or_view
    elsif answer == "edit"
        edit_trip
    end
end

def self.plan_or_view
    puts "Hi " + @user.name + ". Would you like to view your saved trips or plan a new one? (view/plan)"
    action = gets.chomp
    if action == "view"
        view_or_edit
    elsif action == "plan"
        newTrip
        plan_or_view
    else
        puts "Not a valid response"
        plan_or_view
    end 

end












end