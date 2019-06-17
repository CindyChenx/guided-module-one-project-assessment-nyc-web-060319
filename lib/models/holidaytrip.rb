class HolidayTrip < ActiveRecord::Base
    belongs_to :trip 
    belongs_to :holiday
    
end