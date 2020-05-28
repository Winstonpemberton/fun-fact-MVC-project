class FactController < ApplicationController

  # User.facts.each do |fact|
  #   get "/fact/#{fact.name}" do
  #     @fact = fact
  #     erb :'facts/fact_info'
  #   end
  # end

  post "/fact/:id" do
    @fact = Fact.find(params[:id])
    User.facts  << @fact
    redirect to "/account"
  end

  get "fact/delete" do
    erb :'facts/delete_fact'
  end

  delete "/fact/delete/:id" do
    User.facts.destroy(params[:id])
    redirect to "/account"
  end
end
