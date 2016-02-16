class ArticlesController < ApplicationController
  load_and_authorize_resource
  before_filter :article_data, only: [:update, :edit, :destroy, :show]
  def new
    @articles = Article.new
  end

  def create
    @articles = Article.new(article_params)
    if @articles.save
      flash[:success] = Settings.section.notice.article.create
      redirect_to articles_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @articles.update_attributes(article_params)
      flash[:success] = Settings.section.notice.article.update
      redirect_to articles_path
    else
      render :edit
    end
  end

  def destroy
    @articles.destroy
    flash[:danger] =  Settings.section.notice.article.delete
    redirect_to articles_path
  end

  def show
  end

  def index
    @articles = Article.all
  end

  private

    def article_params
      params.require(:article).permit(:name, :published, :author, :description)
    end

    def article_data
      @articles = Article.find_by_id(params[:id])
    end
end
