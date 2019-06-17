class Trip < ActiveRecord::Base
    has_many :holidays
    belongs_to :user
    
end