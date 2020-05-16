class Api::PostController < ApplicationController
  def show
    post=Post.find(params[:id])
    last_comment_id = params[:id].to_i
    @comments = post.comments.includes(:user).where("id > ?", last_comment_id)
  end
end