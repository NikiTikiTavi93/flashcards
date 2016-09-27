require 'open-uri'
require 'nokogiri'
require 'rubygems'
require 'mechanize'

agent = Mechanize.new
PAGE_URL = "http://www.languagedaily.com/learn-german/vocabulary/common-german-words"
page = agent.get(PAGE_URL)
links = page.links_with(text: /Most.*/)
links.map do |link|
  word = link.click
  word.css('tr').each do |td|
    begin
      puts Card.create!(original_text: td.css('td')[1].content,
                   translated_text: td.css('td')[2].content)
    rescue ActiveRecord::RecordInvalid
    end
  end
end

