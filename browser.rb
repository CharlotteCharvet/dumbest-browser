require 'net/http'
require 'nokogiri'



require_relative 'page'

class Browser 
  def run!
    puts "what url do you want to scan ?"
    url = gets.chomp
    page = Page.new(url)

    page.url(url)


    page.fetch!

    puts "What kind of title do you want to store ?"
    title = gets.chomp
    page.title(title)

    puts "Here all the links of your website :"
    page.links


    # Run the browser
    # Display a prompt for a user
    # Parse their input
    # Display useful results by instantiating
    #   a new Page and calling methods on it.
    
    # Questions:
    #  1. How can a user quit the browser gracefully?
    #  2. How can a user ask for help, i.e., how do they know what commands are available to them?
  end
end

Browser.new.run!