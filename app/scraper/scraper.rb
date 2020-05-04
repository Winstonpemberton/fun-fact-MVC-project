require 'open-uri'
# require "Nokogiri"
require 'pry'

class Scraper
  def self.scrape_main_page
    scrape_categories = Nokogiri::HTML(open("https://wtffunfact.com/"))
    category_names = scrape_categories.css("ul li.cat-item a").text.split /(?=[A-Z])/
    # category_names.delete("Health")
    # category_names.delete("Animals")
    # fact_page_urls = ["https://wtffunfact.com/awesome-facts/","https://wtffunfact.com/food-facts/",
    # "https://wtffunfact.com/gaming-facts/","https://wtffunfact.com/history-facts/","https://wtffunfact.com/laws-facts/",
    # "https://wtffunfact.com/movie-facts/","https://wtffunfact.com/people-facts/","https://wtffunfact.com/places-facts/", "https://wtffunfact.com/science/",
    # "https://wtffunfact.com/sports/","https://wtffunfact.com/tech-facts/","https://wtffunfact.com/uncategorized/","https://wtffunfact.com/weird-facts/"]
    #,"https://wtffunfact.com/health-facts/", "https://wtffunfact.com/animal-facts/"
    fact_page_urls = []
    health_url = "https://wtffunfact.com/health-facts/"

    scrape_categories.css(".cat-item").each do |cate|
      fact_page_urls << cate.css("a").attribute("href").value
    end

    category_names.each_with_index do |category, index|
      category = Category.new
      category.name = category_names[index]
      # category.facts = scrape_fact_info(fact_page_urls[index])
      category.facts = scrape_fact_info(health_url)
      Category.all << category
    end
  end

  def self.scrape_fact_info(url)
    scrape_facts = Nokogiri::HTML(open(url))
    facts = []

    scrape_facts.css("article").collect do |fact|
      fact_object = Fact.new
      fact_object.title = fact.css("h2.entry-title").text.split(" – ")[1]
      # date = fact.css("time.entry-date").text
      description_source_url = fact.css("div p a").attribute("href").value
      description_source_info = Nokogiri::HTML(open(description_source_url))
      fact_object.description = description_source_info.css("div.inside-article p").text.split(" – WTF Fun Facts Source: ")[0]
      source_info = description_source_info.css("div.inside-article p").text.split(" – WTF Fun Facts Source: ")[1]
      if fact_object.description == nil
        fact_object.description = description_source_info.css("div.inside-article p").text.split(" – WTF Fun FactsSource: ")[0]
        # source_info = description_source_info.css("div.inside-article p").text.split(" – WTF Fun FactsSource: ")[1]
      end
      binding.pry
      # fact_object = Fact.new(name, date, description, source_info)

      facts << fact_object
      Fact.all << fact_object
    end
    facts
  end
end
