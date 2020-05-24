class CategoriesController < ApplicationController 
  before_action :set_category
  def show
    category=Category.find(params[:id])
    @category=category.name
    @posts = category.posts.order("created_at DESC")
  end
  private
  def set_category
    category1=Category.find(1)
    category2=Category.find(2)
    category3=Category.find(3)
    category4=Category.find(4)
    category5=Category.find(5)
    category6=Category.find(6)
    category7=Category.find(7)

    @category1=category1
    @category2=category2
    @category3=category3
    @category4=category4
    @category5=category5
    @category6=category6
    @category7=category7
  end
end
