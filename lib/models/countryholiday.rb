class CountryHoliday < ActiveRecord::Base
    belongs_to :country
    belongs_to :holiday
    
end