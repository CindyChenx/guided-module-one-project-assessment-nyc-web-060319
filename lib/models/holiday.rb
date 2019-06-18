class Holiday < ActiveRecord::Base
    has_many :holidaytrips
    has_many :trips, through: :holidaytrips
    has_many :countryholidays
    has_many :countries, through: :countryholidays



end
