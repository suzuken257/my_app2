class CategoriesController < ApplicationController
  def show
    @category=Category.find(params[:id])
    @categories = @category.tweets
  end
end
