class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:following, :followers]
  before_action :set_category
  def show
    @user=User.find(params[:id])
    @image = @user.image
    @profile=@user.profile
    @nickname=@user.nickname
    @posts=@user.posts.order("created_at DESC")
  end

  def edit
    user = User.find(params[:id])
    @image = user.image
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
    params.require(:user).permit(:id, :name, :email, :image, :profile)
  end
  def set_category
    book=Category.find(1)
    sport=Category.find_by(name:"スポーツ")
    comedy=Category.find_by(name:"お笑い")
    honda=Category.find_by(name:"本田圭佑")
    economy=Category.find_by(name:"経済")

    @book = book
    @sport=sport
    @comedy = comedy
    @honda=honda
    @economy=economy
  end
end
