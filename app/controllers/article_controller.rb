class ArticleController < ApplicationController
  def show
    @article = Article.find(params[:id])
    @new_review = Review.new
    @reviews = Review.where(article_id: @article.id)
    @go_number = Approve.where(article_id: @article.id).count
  end

  def new
    @article = Article.new
  end

  def create
    if params[:article].present?
        @article = Article.new(params[:article].permit(:title, :is_begginer, :text, :github_url))
        @article.user = current_user

        if @article.save
          redirect_to @article, notice: '投稿しました'
        else
          render :new
        end
    end
  end
  
  def create_review
        @new_review = Review.new(text:  params[:text])
        @new_review.user = current_user;
        @new_review.user_name = current_user.email;
        @article = Article.find_by(user_id: current_user.id)
        @new_review.article = @article

        if @new_review.save
          redirect_to @article, notice: '投稿しました'
        else
          render :new
        end
  end

  def approve
    @approve = Approve.new
    @approve.user = current_user
    @approve.article = Article.find_by(user_id: current_user.id)
        if @approve.save
          redirect_to @approve.article, notice: 'Goしました'
        else
          render :new
        end
  end
end
