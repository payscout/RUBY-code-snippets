require 'uri'
require 'net/http'

url = URI("https://gatewaystaging.payscout.com/api/process")

http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true
http.verify_mode = OpenSSL::SSL::VERIFY_NONE

request = Net::HTTP::Post.new(url)
request["content-type"] = 'application/x-www-form-urlencoded'
request["cache-control"] = 'no-cache'
request.body = "client_username={yourUsername}&client_password={yourPassword}&client_token=token&processing_type=PRE_AUTHORIZATION&billing_first_name=John&billing_last_name=Doe&billing_phone_number=2455464&billing_address_line_1=Innovation%20Street%201&billing_address_line_2=Brilliance%20Building%2C%20Apt.%2022&billing_city=Palo%20Alto&billing_state=CA&billing_postal_code=94024&billing_country=US&billing_email_address=demo%40payscout.com&ip_address=98.97.129.52&billing_date_of_birth=19801229&billing_social_security_number=000000000&expiration_month=10&expiration_year=2022&account_number={yourTestCardNumber}&cvv2=123&currency=USD&initial_amount=99.99&shipping_first_name=Amazing&shipping_last_name=Jane&shipping_email_address=demoshipping%40payscout.com&shipping_cell_phone_number=74477464&shipping_phone_number=7447746400&shipping_address_line_1=Innovation%20Street%201&shipping_address_line_2=Brilliance%20Building%2C%20Apt.%2022&shipping_city=Palo%20Alto&shipping_state=CA&shipping_postal_code=94024&shipping_country=US&billing_invoice_number=1999"

response = http.request(request)
puts response.read_body
