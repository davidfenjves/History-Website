require "sinatra"
require 'nokogiri'
require 'open-uri'

class History
  def initialize
    history_html = open("http://www.historynet.com/today-in-history")
    @nokogiri_doc = Nokogiri::HTML(history_html)
  end


  def event_and_year_hash
    event_and_year = {} 

      @nokogiri_doc.css("body table:nth-child(6) tbody").children.each do |item|
        event_and_year[item.text.strip.split("\n")[0].to_i] = item.text.strip.split("\n")[2]
     end
     event_and_year
   end

  def random_event
    random_event = event_and_year_hash.to_a.sample
    "Random event: #{random_event[0]} - #{random_event[1]} "
  end

   def all_events
    all_events = ""
    event_and_year_hash.each do |year, event|
      if year != 0 
        all_events += "</p>On this day in #{year}, #{event}</p>"
      end
    end
      all_events
    end
end