class ArticleController < ApplicationController
  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(params[:article].permit(:title, :is_begginer, :text, :github_url))
    @article.user = current_user

    if @article.save
      redirect_to article_path, notice: '投稿しました'
    else
      render :new
    end
  end

end
