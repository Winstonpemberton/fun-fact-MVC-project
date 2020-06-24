require 'open-uri'
# require "Nokogiri"
require 'pry'

class Scraper
  # scrapes just the category names from the website so I dont scrape uneccessary categories
  def self.scrape_category_titles
    scrape_categories = Nokogiri::HTML(open("https://wtffunfact.com/"))
    category_names = scrape_categories.css("ul li.cat-item a").text.split /(?=[A-Z])/
    create_category(category_names)
  end
# creates the categories or finds them in the database
  def self.create_category(category_names)
    category_names.each do |category|
      category_name = category
      Category.find_or_create_by(:name => category_name)
    end
  end
  # gets the url to scrape the correct category page but some urls on the sight are different so need if statements
  def self.scrape_facts(category)
    category_page = Nokogiri::HTML(open("https://wtffunfact.com/#{category.name.downcase}-facts/"))

    if category.name == "Animals"
      category_page = Nokogiri::HTML(open("https://www.wtffunfact.com/animal-facts/"))
    end

    if category.name == "Movies"
      category_page = Nokogiri::HTML(open("https://www.wtffunfact.com/movie-facts/"))
    end

    if category.name == "Sports" || category.name == "Science" || category.name == "Uncategorized"
      category_page = Nokogiri::HTML(open("https://wtffunfact.com/#{category.name.downcase}/"))
    else
      puts "something went wrong"
    end
    category.facts = scrape_fact_info(category_page)
  end
# actaully scrapes the facts for a selected category
  def self.scrape_fact_info(category_page)
    facts = []
    category_page.css("article").collect do |fact|
      fact_name = fact.css("h2.entry-title").text.split(" – ")[1]
      if Fact.find_by(:title => fact_name) == nil
        fact_object = Fact.new
        fact_object.title = fact.css("h2.entry-title").text.split(" – ")[1]
        fact_object.image_url = fact.css("div.post-image img").attribute("src").value
        description_source_url = fact.css("h2.entry-title a").attribute("href").value

        description_source_info = Nokogiri::HTML(open(description_source_url))
        fact_object.description = description_source_info.css("div.inside-article p").text.split(" – WTF Fun Facts Source: ")[0]
        source_info = description_source_info.css("div.inside-article p").text.split(" – WTF Fun Facts Source: ")[1]

        if source_info == nil
          fact_object.description = description_source_info.css("div.inside-article p").text.split(" – WTF Fun FactsSource: ")[0]
        end
        facts << fact_object

      else
        fact_object = Fact.find_by(:title => fact_name)
        facts << fact_object
      end
    end
    facts
  end
end
