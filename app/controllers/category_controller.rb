class CategoryController < ApplicationController

  get "/categories" do
    # @categories = Category.all
    @categories = Scraper.scrape_category_titles
    erb :categories
  end

  post "/categories/:category" do
    @category = params[:category]

  end

  Category.all.each do |category|
    get "/category/#{category.name}" do
      @category_facts = category.facts
      erb :category_facts
    end
  end
end
