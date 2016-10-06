require "rest-client"

RestClient.proxy = ENV["PROXIMO_URL"] if ENV["PROXIMO_URL"]

res = RestClient.get("https://www.coffee-cup.com")

puts "status code", res.code
puts "headers", res.headers