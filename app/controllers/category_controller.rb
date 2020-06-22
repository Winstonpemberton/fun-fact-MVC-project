class CategoryController < ApplicationController

# gets and creates categories but just their names
  get "/categories" do
    @categories = Category.all
    Scraper.scrape_category_titles
    erb :'categories/categories'
  end
# once the user selects a category this is used to scrape the facts for it
  post '/categories/:id' do
    category = Category.find(params[:category])
    Scraper.scrape_facts(category)
    @category_facts = category.facts
    erb :'categories/category_facts'
  end
end
