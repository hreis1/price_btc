require 'net/http'
require 'json'

https = Net::HTTP.new('api.binance.com', 443)
# para fazer chamadas https
https.use_ssl = true
 
response = https.get("/api/v3/ticker/price?symbol=BTCBRL")
# status code
puts response.code
# status message
puts response.message
# body (json)
doc = response.body
#body (hash)
doc = JSON.parse(response.body)

File.open('btc_doc.txt','a') do |line|
    doc.each do |key, value|
        line.print "#{value} "
    end
    line.puts ''
end
