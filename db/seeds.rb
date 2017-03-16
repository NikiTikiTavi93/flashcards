require 'open-uri'
require 'nokogiri'
require 'rubygems'
require 'mechanize'

agent = Mechanize.new
PAGE_URL = "http://iloveenglish.ru/vocabulary"
page = agent.get(PAGE_URL)
links = page.links_with(href: /vocabulary\/\w+[^#]\w+$/)
page_words = links.map do |link|
  words = link.click
  words.css('tr').each do |tr|
    word = tr.search('td')[1].text
    if word.blank?
      word.remove
    else
      begin
        Card.create(original_text: word.split('—')[0],
          translated_text: word.split('—')[1])
      rescue Errno::EPIPE
        puts "Connection broke!"
      end
    end
  end
end

