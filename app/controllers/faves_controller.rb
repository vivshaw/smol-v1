class FavesController < ApplicationController
  respond_to :js

  def fave
    @user = current_user
    @post = Post.find(params[:post_id])
    @user.fave!(@post)
  end

  def unfave
    @user = current_user
    @fave = @user.faves.find_by_post_id(params[:post_id])
    @post = Post.find(params[:post_id])
    @fave.destroy!
  end

end
