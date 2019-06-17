class Trip < ActiveRecord::Base
    has_many :holidaytrips
    has_many :holidays, through: :holidaytrips
    belongs_to :user
    
end