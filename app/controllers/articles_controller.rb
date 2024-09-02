class ArticlesController < ApplicationController
  def index
    @articles = Rails.cache.fetch("articles", expires_in: 20.seconds) do
      Article.latest.to_a;
    end
  end

  def show
    @article  = Article.find(params[:id])
    @comments = @article.comments.where(status: 'published').all

    @comment = Comment.new
    # This is the way which you can specify a custom render view
    render "article"
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
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
      params.require(:article).permit(:title, :body)
    end

end
