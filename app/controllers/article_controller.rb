class ArticleController < ApplicationController
  def show
	
  end

  def create
    @article = Article.new()
  end


end
