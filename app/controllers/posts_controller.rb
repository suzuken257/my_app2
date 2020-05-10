class PostsController < ApplicationController
  before_action :set_post, only:[:edit,:show]
  before_action :move_to_index, except: [:index, :show, :search]
  before_action :set_category
  def index
    @posts = Post.includes(:user).order("created_at DESC")
  end
  def new
    @post = Post.new
  end
  def create
    if Post.create(post_params)
      redirect_to  "/users/#{current_user.id}", notice: '投稿が完了しました'
    else
      render :new
    end
  end
  def destroy
    post=Post.find(params[:id])
    if post.destroy
      redirect_to "/users/#{current_user.id}", notice: '削除が完了しました'
    else
      render :destroy
    end
  end
  def edit
  end
  def update
    post  = Post.find(params[:id])
    if post.update(post_params)
      redirect_to "/users/#{current_user.id}", notice: '編集が完了しました'
    else
      render :edit
    end
  end
  def show
    @comment=Comment.new
    @comments = @post.comments.includes(:user)
  end
  def search
    @posts = Post.search(params[:keyword])
    respond_to do |format|
      format.html
      format.json
    end
  end

  private
  def post_params
    params.require(:post).permit(:title,:video,:text,category_ids: []).merge(user_id: current_user.id)
  end

  def set_post
    @post=Post.find(params[:id])
  end

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

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

end
