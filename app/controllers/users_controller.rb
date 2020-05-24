class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:following, :followers]
  before_action :set_category
  def show
    @user=User.find(params[:id])
    @image = @user.image
    @profile=@user.profile
    @nickname=@user.nickname
    @posts=@user.posts.order("created_at DESC")
    @todo=Todo.new
    @todos = @user.todos.includes(:user)
  end

  def edit
    user = User.find(params[:id])
    @image = user.image
  end

  def create
    @user = User.create(user_params)
    respond_to do |format|
      format.html { redirect_to user_path(params[:user_id]) }
      format.json
    end
  end

  def update
    if current_user.update(user_params)
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

  def following
    @user = User.find(params[:id])
    @users = @user.following.page(params[:page]).per(3)
  end

  def followers
    @user = User.find(params[:id])
    @users = @user.followers.page(params[:page]).per(3)
  end

  private
  def user_params
    params.require(:user).permit(:id, :nickname, :email, :image, :profile)
  end
  def set_category
    category1=Category.find(1)
    category2=Category.find(2)
    category3=Category.find(3)
    category4=Category.find(4)
    category5=Category.find(5)
    category6=Category.find(6)
    category7=Category.find(7)

    @category1 = category1
    @category2=category2
    @category3 = category3
    @category4=category4
    @category5=category5
    @category6=category6
    @category7=category7
  end
end
