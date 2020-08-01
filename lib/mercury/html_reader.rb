require 'net/http'

module Mercury
  class HtmlReader
    def initialize(options)
      @infile   = options[:infile]
      @category = options[:category]
    end

    def read_website
      url = 'https://masayuki14.github.io/pit-news/'
      url = url + '?category=' + @category if @category
      Net::HTTP.get(URI(url))
    end

    def read
      if @infile
        File.read(@infile)
      else
        read_website
      end
    end
  end
end