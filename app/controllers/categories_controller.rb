class CategoriesController < ApplicationController
  @book=Category.find_by(name:"本").id
  @sport=Category.find_by(name:"スポーツ").id
  @comedy=Category.find_by(name:"お笑い").id
  def show
    @posts = Post.includes(:user)
  end
end
