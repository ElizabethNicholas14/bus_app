module LocationsHelper

  # gets all the buses from the atlanta bus API - bus api url doesn't have to be called the same thing
  def get_all_buses_from_api(bus_api_url)
    raw_http = Net::HTTP.get_response(URI.parse(bus_api_url))
    bus_data = raw_http.body

    JSON.parse(bus_data)
  end

  # return only buses nearby
  def is_nearby?(user_lat, user_long, bus_lat, bus_long)
    # got this from calculating degrees
    max_distance = 0.01

    difference_latitudes = user_lat - bus_lat.to_f
    difference_longitudes = user_long - bus_long.to_f

    # square them both and use the radious to get the local
    distance = Math.sqrt(difference_latitudes ** 2 + difference_longitudes ** 2)
    # distance within max range? - this is a boolean
    distance <= max_distance
  end

end