require_relative 'mercury/pre_processer'
require_relative 'mercury/html_reader'
require_relative 'mercury/scraper'
require_relative 'mercury/json_writer'

module Mercury
  def self.main(argv)
    options = PreProcesser.exec(argv)
    reader = HtmlReader.new(options)
    writer = JsonWriter.new(options)

    pitnews = Scraper.scrape(reader.read)
    writer.write(pitnews)
  end
end