class ArticlesController < ApplicationController

  # show all articles
  def index
    @articles = Article.all
  end

  #show independent article

  def show
    @article = Article.find(params[:id])
  end

  # initialize creating new article

  def new 
    @article = Article.new
  end

  # create new article
  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to articles_path
    else
      :new
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    respond_to do |format|
      format.html { redirect_to articles_url, notice: "Article was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
  def article_params
    params.require(:article).permit(:title, :description)
   end
end

