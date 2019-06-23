require 'open-uri'
require 'pry'
require 'nokogiri'

html = open("URL - put in site")

doc = Nokogiri::HTML

class Scraper

  def self.scrape_index_page(index_url)
    output = []
    doc = Nokogiri::HTML(open(index_url))
    student = doc.css('div.card-text-container')

     student.each { |student|
      name = student.css('h4.student-name').text
      location = student.css('p.student-location').text
      url = student.parent.first[1]
      output << {
        :name => name,
        :location => location,
        :profile_url => url,
      }
    }

     output
  end

  def self.scrape_profile_page(profile_url)
    
  end

end

