class CategoryController < ApplicationController

  get "/categories" do
    @categories = Category.all
    # @categories = Scraper.scrape_category_titles
    Scraper.scrape_category_titles
    erb :'categories/categories'
  end

  post "/categories/:id" do
    @category = Category.find(params[:id])
    Scraper.scrape_facts(category)
    @category_facts = category.facts
    erb :'categories/category_facts'
  end

  # Category.all.each do |category|
  #   get "/category/#{category.name}" do
  #     @category_facts = category.facts
  #     erb :category_facts
  #   end
  # end
end
