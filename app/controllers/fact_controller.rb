class FactController < ApplicationController
 # @current_user = User.find_by_id(session[:id])
 #
 #   @current_user.facts.each do |fact|
 #     get "/fact/#{fact.title}" do
 #       @fact = fact
 #       erb :'facts/fact_info'
 #     end
 #   end

#  get '/songs/:slug' do
#   @song = Song.find {|song| song.slug == params[:slug]}
#   erb :'/songs/show'
# end

  get '/fact/:slug' do
    @fact = Fact.find {|fact| fact.slug == params[:slug] }
    erb :'facts/fact_info'
  end

  post "/fact/:id" do
    @fact = Fact.find(params[:user][:facts])
    # @current_user = User.find_by_id(session[:id])
    @current_user.facts  << @fact
    redirect to "/account"
  end

  get "fact/delete" do
    erb :'facts/delete_fact'
  end

  delete "/fact/delete/:id" do
    @current_user.facts.destroy(params[:id])
    redirect to "/account"
  end
end
