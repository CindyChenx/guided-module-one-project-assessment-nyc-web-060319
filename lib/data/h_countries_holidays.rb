
	require 'rest-client'
	require 'json'
	require 'pry'


	$the_world = ["ne","ng","kp","mk","mp","no","om","pk","pw","pa","pg","py","pe","ph","pl","pt","pr","qa","re","ro","ru","rw","sh","kn","lc","mf"]
	$holidays_of_the_world = {}
	$sleep_time = (rand(2000..20000))/1000

	def get_holidays_for_country(list)
		list.each do |c|
			#$holidays_of_the_world << c #Change to Hash
			response = RestClient.get("https://calendarific.com/api/v2/holidays?&api_key=69c17a11b1490a34725e55693d121a624e7f8c02&country=#{c}&year=2019")
			$holidays_of_the_world[c.to_sym] = JSON.parse(response)
			sleep($sleep_time)
		end
	end

	get_holidays_for_country($the_world)


	puts "Records are: "
	puts $holidays_of_the_world
	puts
	puts
	puts
	puts "END"


