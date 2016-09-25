require 'open-uri'
require 'nokogiri'

namespace :db do
  desc "Create new cards from Nokogiri"
  task seed: :environment do
    PAGE_URL = "http://www.languagedaily.com/learn-german/vocabulary/common-german-words"
    page = Nokogiri::HTML(open(PAGE_URL))
    page.css('tr').each do |td|
        Card.create!(original_text: td.css('td')[1].content,
            translated_text: td.css('td')[2].content,
            review_date: Time.zone.today)
    end
  end
end
