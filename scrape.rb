require 'net/http'

# def get_from(url)
#   url = 'https://masayuki14.github.io/pit-news/'
#   uri = URI(url)
#   html = Net::HTTP.get(uri)
#   # htmlを返す
#   return 'html'
# end

def get_from(url)
  Net::HTTP.get(URI(url))
end

# def write_file(path, text)
#   file = File.open(path, 'w')
#   file.write(text)
#   file.close
# end

def write_file(path, text)
  File.open(path, 'w') { |file| file.write(text) }
end

write_file('pitnews.html', get_from('https://masayuki14.github.io/pit-news/'))