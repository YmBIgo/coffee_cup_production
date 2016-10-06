require "rest-client"

namespace :proxytasks do

  desc "Generate proxy"

  task :generate => :environment do

    geoip ||= GeoIP.new(Rails.root.join( "db/GeoIP.dat" ))
    watching_ip = request.env["HTTP_X_FORWARDED_FOR"] || request.remote_ip
    country = geoip.country(watching_ip)
    code = country.country_code2.downcase

    if code == 'cn'
      RestClient.proxy = ENV["PROXIMO_URL"] if ENV["PROXIMO_URL"]

      res = RestClient.get("http://api.someservice.com/endpoint")

      puts "status code", res.code
      puts "headers", res.headers
    end

  end

end
