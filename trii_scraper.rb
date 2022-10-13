require 'open-uri'
require 'nokogiri'

def get_page

  html = URI.open("https://trii.co/stock-list")
  doc = Nokogiri::HTML(html)

  stock_list = doc.css(".action")

  stocks = stock_list.map do |item|
    image = item.at_css('.action__logo').attr('src')
    name = item.at_css('.action__name').text
    code = item.at_css('.action__code').text
    price = item.at_css('.price').text

    {
      "image": image,
      "name": name,
      "code": code,
      "price": price
    }
  end
  stocks
end
