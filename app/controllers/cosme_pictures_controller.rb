class CosmePicturesController < ApplicationController
  before_action :require_user_logged_in, only: [:new, :create, :destroy]
  before_action :correct_user, only: [:destroy]
  
  def index
    @cosme_pictures = CosmePicture.all.page(params[:page])
  end

  def show
    @cosme_picture = CosmePicture.find(params[:id])
    @user = @cosme_picture.user
  end

  def new
    @cosme_picture = CosmePicture.new
  end

  def create
     @cosme_picture = current_user.cosme_pictures.build(cosme_pictures_params)
    if@cosme_picture.save
      flash[:success] = '投稿しました。'
      redirect_to root_url
    else
      @cosme_pictures = CosmePicture.all.page(params[:page])
      flash.now[:danger] = '投稿に失敗しました。'
      render '/cosme_pictures/index'
    end
  end

  def edit
  end

  def destroy
    @cosme_picture.destroy
    flash[:success] = '削除しました。'
    redirect_back(fallback_location: root_path)
  end
  
  private
  def cosme_pictures_params
    params.require(:cosme_picture).permit(:picture, :tag_list)
  end
  
  def correct_user
    @cosme_picture = current_user.cosme_pictures.find_by(id: params[:id])
    unless @cosme_picture
      redirect_to root_url
    end
  end
end
