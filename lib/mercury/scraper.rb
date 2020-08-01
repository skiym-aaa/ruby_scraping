require 'nokogiri'

module Mercury
  class Scraper
    def self.scrape_news(news)
      {
        title: news.xpath('./p/strong/a').first.text,
        url: news.xpath('./p/strong/a').first['href']
      }
    end

    def self.scrape_section(section)
      {
        category: section.xpath('./h6').first.text,
        news: section.xpath('./div/div').map { |node| scrape_news(node) }
      }
    end

    def self.scrape(html)
      doc = Nokogiri::HTML.parse(html, nil, 'utf-8')
      doc.xpath('/html/body/main/section[position() > 1]').map { |section| scrape_section(section) }
    end
  end
end