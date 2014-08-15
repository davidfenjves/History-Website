require 'nokogiri'
require 'open-uri'

history_html = open("http://www.historynet.com/today-in-history")

nokogiri_doc = Nokogiri::HTML(history_html)

title = nokogiri_doc.css("head title").text

# event_and_year = {}

# nokogiri_doc.css("body table:nth-child(6) tbody").children.each do |item|
#   event_and_year[item.text.strip.split("\n")[0].to_i] = item.text.strip.split("\n")[2]
# end

# event_and_year

# # nokogiri_doc.css("body table:nth-child(6) tbody").children.each do |event|
  
# # end

# # end


# pets_hash = {:dog => "Teddy"}

# pets_hash[:cat] = "Growler"

# event_and_year.each do |year, event|
#   if year > 1945
#     puts "#{year} - #{event}"
#   end
# end




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
    "your random event: #{random_event[0]} - #{random_event[1]} "
  end

  def all_events
    all_events = ""
    event_and_year_hash.each do |year, event|
      all_events += "On this day in #{year}, #{event}\n"
    end
    all_events
  end

end



  # def year
  #   @nokogiri_doc.css("body table:nth-child(6) tbody").children.each do |item| 
  #     item.text.strip.split("\n")[0].to_i
  #   end
  # end

  # def event
  #   @nokogiri_doc.css("body table:nth-child(6) tbody").children.each do |item|
  #   item.text.strip.split("\n")[2]
  #   end
  # end

  # def on_this_day
  #   puts "On this day in #{year} #{event}"
  # end

test1 = History.new

puts test1.all_events
