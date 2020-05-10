class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:following, :followers]
  before_action :set_category
  def show
    @user=User.find(params[:id])
    @nickname=@user.nickname
    @posts=@user.posts.order("created_at DESC")
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
  def set_category
    book=Category.find(1)
    sport=Category.find_by(name:"スポーツ")
    comedy=Category.find_by(name:"お笑い")
    makonari=Category.find_by(name:"まこなり社長")
    economy=Category.find_by(name:"経済")

    @book = book
    @sport=sport
    @comedy = comedy
    @makonari=makonari
    @economy=economy
  end
end
