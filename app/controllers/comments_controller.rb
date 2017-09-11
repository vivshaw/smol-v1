class CommentsController < ApplicationController
  before_action :find_post
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def new
    @comment = Comment.new
  end

  def create
    @comment = @post.comments.new(comment_params.merge(:user_id => current_user.id))

    if @comment.save
      redirect_to post_by_user_path(@post.user.username, @post.id), notice: 'Comment created!'
    else
      redirect_to post_by_user_path(@post.user.username, @post.id)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def find_post
    @post = Post.find_by_id(params[:post_id])
  end
end
