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

  delete "/fact/delete/:id" do
    User.facts.destroy(params[:id])
    redirect to "/account"
  end
end
