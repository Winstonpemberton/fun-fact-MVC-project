class FactController < ApplicationController

  User.facts.each do |fact|
    get "/fact/#{fact.name}" do
      @fact = fact
      erb :fact_info
    end
  end

  get "fact/delete" do
    erb :delete_fact
  end
end
