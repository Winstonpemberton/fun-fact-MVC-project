require 'open-uri'
# require "Nokogiri"
require 'pry'

class Scraper
  def self.scrape_category_titles
    scrape_categories = Nokogiri::HTML(open("https://wtffunfact.com/"))
    category_names = scrape_categories.css("ul li.cat-item a").text.split /(?=[A-Z])/
    category_names.each do |category|
      category = Category.new
      category.name = category_names[index]
      Category.all << category
    end
  end

  def self.scrape_main_page
    scrape_categories = Nokogiri::HTML(open("https://wtffunfact.com/"))
    category_names = scrape_categories.css("ul li.cat-item a").text.split /(?=[A-Z])/
    fact_page_urls = []

    scrape_categories.css(".cat-item").each do |cate|
      fact_page_urls << cate.css("a").attribute("href").value
    end

    category_names.each_with_index do |category, index|
      category = Category.new
      category.name = category_names[index]
      category.facts = scrape_fact_info(fact_page_urls[index])
      Category.all << category
    end
  end

  def self.scrape_fact_info(url)
    scrape_facts = Nokogiri::HTML(open(url))
    facts = []

    scrape_facts.css("article").collect do |fact|
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
      Fact.all << fact_object
    end
    facts
  end
end
