class CommentsController < ApplicationController
  http_basic_authenticate_with name: "sjb", password: "secret", only: :destroy
  
  def create 
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    redirect_to articles_path(@article)
  end
  
  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(comment_params)
    @comment.destroy
    redirect_to article_path(@article)
  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end
