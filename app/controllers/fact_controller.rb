class FactController < UserController
 # @current_user = User.find_by_id(session[:id])
 #
 #   @current_user.facts.each do |fact|
 #     get "/fact/#{fact.title}" do
 #       @fact = fact
 #       erb :'facts/fact_info'
 #     end
 #   end

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
