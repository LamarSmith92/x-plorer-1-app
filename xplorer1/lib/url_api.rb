require 'httparty'

# Use the class methods to get down to business quickly
res = HTTParty.get('http://api.open-notify.org/iss-now.json')
data = JSON.parse(res.body)

puts data["iss_position"]

#Populate a dummy set of cookies (string)
#Render on map

#Write in the cookie with data from API call
#And try


# class Iss
#   include HTTParty
#   def initialize()
#   end
# end
