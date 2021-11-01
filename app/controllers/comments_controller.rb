class CommentsController < ApplicationController
  def create 
    @micropost = Micropost.find(params[:micropost_id]) 
    @comment = @micropost.comments.build(params[:comment].permit(:body))
    @comment.user = current_user
    @comment.save
    redirect_to micropost_path(@micropost)
  end
end