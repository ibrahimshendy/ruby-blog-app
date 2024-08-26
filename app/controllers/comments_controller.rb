class CommentsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])

    @comment = @article.comments.new(comment_params)

    if @comment.save
      redirect_to article_path(@article)
    else
      render ArticlesController.show, status: :unprocessable_entity
      redirect_to article_path(@article), status: :unprocessable_entity
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:comment)
  end
end
