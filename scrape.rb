require 'net/http'

# 対象サイトのURLを指定してHTMLを取得し標準出力に表示します
url = 'https://masayuki14.github.io/pit-news/'
uri = URI(url)

html = Net::HTTP.get(uri)

file = File.open('pit-news.html', 'w')
file.write(html)
file.close