class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:edit, :destroy]
  before_action :correct_user, only: [:destroy]
  
  def index
  end

  def show
    @user = User.find(params[:id])
    @cosme_pictures = @user.cosme_pictures.page(params[:page])
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:success] = 'ユーザを登録しました。'
      redirect_to @user
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = 'アカウントを削除しました。'
    redirect_to root_url
  end


 private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end

  def correct_user
    @user = current_user
    unless @micropost
    redirect_to root_url
    end
  end
