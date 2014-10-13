class Admin::ArticlesController < AdminController
  def index
    @articles = Article.order('id desc')
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new article_params

    if @article_save
      redirect_to admin_articles_path
    else
      render :new
    end
  end

  def edit
    @article = Article.find params[:id]
  end

  def update
    @article = Article.find params[:id]

    if @article.update_attributes article_params
      @article = Article.find params[:id]
    else
      render :edit
    end
  end

  def destroy
    @article = Article.find params[:id]
    @article.destroy
    redirect_to :back
  end

  private

  def article_params
    params.require(:article).permit!
  end
end