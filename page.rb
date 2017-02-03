require 'uri'
require 'net/http'
require 'nokogiri'


class Page
  def initialize(url)
    @uri = URI.parse(url)
  end
  
  def url(url)
    puts "the url you are looking into is : #{url}"
  end

  def fetch!
    reponse = Net::HTTP.get_response(@uri)
    @body = Nokogiri::HTML(reponse.body)
  end
  
  def title(title)
    @body.css(title).each_with_index do |title, index|
      puts "#{index + 1} : #{title.text}"
    end
  end
  
  def links
    @body.css('a').each_with_index do |link, index|
      puts "#{index + 1} : #{link['href']}"
    end
    # Research alert!
    # How do you use Nokogiri to extract all the link URLs on a page?
    #
    # These should only be URLs that look like
    #   <a href="http://somesite.com/page.html">Click here!</a>
    # This would pull out "http://somesite.com/page.html"
  end
end




