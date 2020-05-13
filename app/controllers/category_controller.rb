class CategoryController < ApplicationController

  get "/categories" do
    @categories = Category.all
    erb :categories
  end

  Category.all.each do |category|
    get "/category/#{category.name}" do
      @category_facts = category.facts
      erb :category_facts
    end
  end
end
