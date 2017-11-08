require 'uri'
require 'net/http'

url = URI("https://gatewaystaging.payscout.com/api/process")

http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true
http.verify_mode = OpenSSL::SSL::VERIFY_NONE

request = Net::HTTP::Post.new(url)
request["content-type"] = 'application/x-www-form-urlencoded'
request["cache-control"] = 'no-cache'
request.body = "client_username={yourUsername}&client_password={yourPassword}&client_token=token&processing_type=REFUND&currency=USD&initial_amount=99.99&original_transaction_id=A0001FFCDJ9"

response = http.request(request)
puts response.read_body 
