class ArticlesController < ApplicationController
before_action :authenticate_user!
# before_action :current_user

	def index
		@articles = current_user.articles.all
	end

	def new
		@article = Article.new
	end


	def show
		@article = Article.find(params[:id])
	end

	def create
 	 	@article = current_user.articles.new(article_params)
 
  		if @article.save
  		redirect_to @article
  		else 
  			render 'new'
  		end
	end

  	def edit
  		@article = current_user.articles.find(params[:id])
  	end

  	def update
  		@article = current_user.articles.find(params[:id])
 
  		if @article.update(article_params)
    	redirect_to @article
  		else
    	render 'edit'
  		end
	end

	def destroy
		@article = current_user.articles.find(params[:id])
		@article.destroy

		redirect_to articles_path
	end

	private
  	def article_params
    	params.require(:article).permit(:title, :text)
  	end

end

