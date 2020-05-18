class FactController < ApplicationController

  User.facts.each do |fact|
    get "/fact/#{fact.name}" do
      @fact = fact
      erb :fact_info
    end
  end
end
