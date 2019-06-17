class Holiday < ActiveRecord::Base
    has_many :trips
    has_many :countries
    
end