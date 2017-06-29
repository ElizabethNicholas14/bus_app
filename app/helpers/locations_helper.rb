  #used to put extra helper methods without bloating your controller code

module LocationsHelper
  #Gets all the buses from the ATL bus APIs
  def get_all_buses_from_api(bus_api_url)
    raw_http = Net::HTTP.get_response(URI.parse(bus_api_url))
    bus_data = raw_http.body

    JSON.parse(bus_data)
  end

  #Returning only buses near to the person
  def is_nearby?(user_lat, user_long, bus_lat, bus_long)
    max_distance = 0.01
    difference_latitudes = user_lat - bus_lat.to_f
    difference_longititudes = user_long - bus_long.to_f

    distance = Math.sqrt(difference_latitudes ** 2 + difference_longititudes ** 2)
    distance <= max_distance
  end

end
