class ArticlesController < ApplicationController
  before_action :require_login, except: [:index]
  before_action :require_ownership, only: [:edit, :update, :destroy]
  
  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end


  def create
    @article = Article.new(
      title: params[:article][:title],
      author: params[:article][:author],
      user: current_user
    )

    if @article.save
      redirect_to root_path
    else 
      flash.now[:alert] = @article.errors.full_messages
      render :new
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article && @article.update(title: params[:article][:title], author: params[:article][:author], user: current_user)
      redirect_to root_path
    else 
      flash.now[:alert] = @article.errors.full_messages
      render :edit
    end
  end

  def show
    @article = Article.find(params[:id])
    render :show
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to root_path
  end

  def require_login
    unless session[:user_id]
      flash[:alert] = 'you must be logged in'
      redirect_to new_sessions_path
    end
  end

  def require_ownership
    @article = Article.find(params[:id])
    unless current_user == @article.user
      flash[:alert] = 'you do not own this article'
        redirect_to root_path
    end
  end

end

