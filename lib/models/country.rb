class Country < ActiveRecord::Base
    has_many :countryholidays
    has_many :holidays, through: :countryholidays
    
end