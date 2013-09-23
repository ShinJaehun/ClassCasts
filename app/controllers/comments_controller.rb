class CommentsController < ApplicationController
  # devise
  before_filter :authenticate_user!

  def create
    # comment를 생성하기 위해 post 호출
    @post = Post.find(params[:post_id])

    # 실제 comment 생성   
    @comment = @post.comments.build(params[:comment])
    @comment.user_id = current_user.id
    @comment.save

    # post 뷰에 comment를 생성하도록 redirect
    redirect_to post_path(@post)
  end
 
 def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end
 

 end