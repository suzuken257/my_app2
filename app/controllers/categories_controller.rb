class CategoriesController < ApplicationController 
  before_action :set_category
  def show
    category=Category.find(params[:id])
    @category=category.name
    @posts = category.posts.order("created_at DESC")
  end
  private
  def set_category
    book=Category.find_by(name:"本")
    sport=Category.find_by(name:"スポーツ")
    comedy=Category.find_by(name:"お笑い")
    honda=Category.find_by(name:"本田圭佑")
    economy=Category.find_by(name:"経済")
    makonari=Category.find_by(name:"まこなり社長")

    @book = book
    @sport=sport
    @comedy = comedy
    @honda=honda
    @economy=economy
    @makonari=makonari
  end
end
