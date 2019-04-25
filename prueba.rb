

#metodo request

require 'uri'
require 'net/http'
require 'json'

def request(url,api_key)

  url = URI("#{url}#{api_key}")

  http = Net::HTTP.new(url.host, url.port)

  http.use_ssl = true
  http.verify_mode = OpenSSL::SSL::VERIFY_NONE

  request = Net::HTTP::Get.new(url)
  request["cache-control"] = 'no-cache'
  request["Postman-Token"] = 'c28c21ff-a113-4e13-aa6a-3965f47804bc'

  response = http.request(request)

  response.read_body
  return JSON.parse(response.read_body)
end

data = request("https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=1000&api_key=", "nf9rP1SKVTLRPaTczjhaDfypAJxBK2NgoVBNiORf")

def build_web_page(data)

  photos = data['photos'].map{|x| x['img_src']}
  html_inicio = "<html>\n<head>\n</head>\n<body>\n<ul>\n"
  html_final = "</ul>\n</body>\n</html>"
  html = ""
  photos.each do |photo|
  html += "\t<img src=\"#{photo}\">\n"
  end
  File.write('output.html', html_inicio + html + html_final)

end

def photos_count(data)

  camera = data['photos'].map{|x| x['name']}

end

request("https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=1000&api_key=", "nf9rP1SKVTLRPaTczjhaDfypAJxBK2NgoVBNiORf")

build_web_page(data)

photos_count(data)
