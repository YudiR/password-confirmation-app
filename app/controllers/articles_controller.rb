class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end


  def create
    @article = Article.new(
      title: params[:article][:title],
      author: params[:article][:author]
      user: current_user
    )

    if @article.save
      redirect_to root_path
    else 
      flash.now[:alert] = @article.errors.full_messages
      render :new
  end

  def edit
  end

  def update
  end

  def show
    @article = Article.find(params[:id])
    render :show
  end

  def destroy
  end
end
