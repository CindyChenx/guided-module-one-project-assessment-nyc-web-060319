class Trip < ActiveRecord::Base
    has_many :holidaytrips
    has_many :holidays, through: :holidaytrips
    belongs_to :user


    # helper method 
    def turn_to_num(date)
        return (date[0..3] + date[5..6] + date[8..9]).to_i
    end

    # user searches for holidays in the trip's date range
    def search_holidays

        start_day = turn_to_num(self.start_date)
        end_day = turn_to_num(self.end_date)

        Holiday.all.select do |hol|
            turn_to_num(hol.date) >= start_day && turn_to_num(hol.date) <= end_day
        end

    end

    # CountryHoliday table by date range
    def return_ch
        answer = []
        search_holidays.each do |hol|
            CountryHoliday.all.each do |ch|
                    if hol.id == ch.holiday_id
                        answer << ch
                    end
            end
        end
        return answer
    end

    # country has holidays on the trip date range
    def search_countries
       countries = []
       return_ch.each do |ch|
            rightCountry = Country.all.find do |co|
                co.id == ch.country_id
            end
            countries << rightCountry.name     
         end
         return countries.uniq
     end

     # available holidays in that country
     def search_holidays_by_country(country_name)
        chs = return_ch.select do |ch|
            ch.country_id == Country.find_by(name: country_name).id
        end
        hols = []
        chs.each do |ch|
            Holiday.all.each do |hol|
                if ch.holiday_id == hol.id
                    hols << hol
                end
            end
        end
        return hols
    end
        


    def display_holiday(country_name)
        holidayHash = {}
        hols = self.search_holidays_by_country(country_name)
        hols.each do |hol|
            holidayHash[hol.id] = {name: hol.name, description: hol.description, type: hol.type_of_holiday, id: hol.id, date: hol.date}
        end
        return holidayHash
    end

end