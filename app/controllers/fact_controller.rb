class FactController < ApplicationController

# used to delete go to the page to delete a fact
  get "/fact/delete" do
    @current_user = User.find_by_id(session[:id])
    erb :'facts/delete_fact'
  end

  post '/fact/comments/edit' do
    @comment = Comment.find_by_id(params[:comment])
    erb :'facts/edit_comment_text'
  end

  patch '/fact/comments/edit_text' do
    @comment = Comment.find_by_id(params.keys[1].to_i)
    @comment.text = params.values[1].values.join
    @comment.save
    @fact = Fact.find_by_id(@comment.fact_id)

    redirect to "/fact/#{@fact.slug}"
  end

  get "/fact/comments/edit/:fact" do
    @fact = Fact.find_by_id(params[:fact])
    @current_user = User.find_by_id(session[:id])
    erb :'facts/edit_comment'
  end


  post "/fact/comments" do
    @current_user = User.find_by_id(session[:id])
    @fact = Fact.find_by_id(params.keys.join.to_i)
    @comment = Comment.new
    @comment.text = params[params.keys.join][:comments]
    @current_user.comments << @comment
    @fact.comments << @comment
    @comment.save
    redirect to "/fact/#{@fact.slug}"
  end

# used to add a fact to the users account
  post "/fact/:id" do
    @fact = Fact.find(params[:user][:facts])
    @current_user = User.find_by_id(session[:id])
    @current_user.facts  << @fact
    redirect to "/account"
  end

# actually deletes the fact from the users account
  delete "/fact/delete/:id" do
    @current_user = User.find_by_id(session[:id])
    @current_user.facts.destroy(params[:user][:facts])
    redirect to "/account"
  end

# pulls up the the information on a single fact
  get '/fact/:slug' do
    @fact = Fact.find {|fact| fact.slug == params[:slug] }
    erb :'facts/fact_info'
  end

end
