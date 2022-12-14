class ArticlesController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  # before_action :find_article, only: [:show, :edit, :update, :destroy]
  before_action :find_article, except: [:index, :new, :create, :user_articles]

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def show
  end

  def edit
  end

  def create
    # @article = Article.create(title: params[:article][:title], content: params[:article][:content], user: current_user)
    @article = current_user.articles.create(title: params[:article][:title], content: params[:article][:content], user: current_user)
    render json: @article
  end

  def update
    @article.update(title: params[:article][:title], content: params[:article][:content])
    redirect_to @article
  end

  def destroy
    @article.destroy
    redirect_to root_path
  end

  def find_article
    @article = Article.find(params[:id])
  end

  def user_articles
    @user = User.find(params[:user_id])
    render 'articles/index'
  end
end
