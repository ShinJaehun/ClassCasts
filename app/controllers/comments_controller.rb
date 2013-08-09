class CommentsController < ApplicationController
  before_filter :authenticate_user!
#load_and_authorize_resource

  def create
    @post = Post.find(params[:post_id])
    #@comment = current_user.comments.build(params[:comment])
    @comment = @post.comments.build(params[:comment])
    @comment.user_id = current_user.id
    @comment.save
    #@comment.user_id = current_user.id

    redirect_to post_path(@post)
  end


  def destroy
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:comment_id])
    @comment.destroy
  end

end