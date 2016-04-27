class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def profile
    @user = User.find(params[:id])
    @posts = Post.where(user_id: @user.id).order("created_at DESC")
  end

  def allUsers
    @users = User.all
  end

  def follow
    @user = User.find(params[:id])
    current_user.follow(@user)
    redirect_to "/usuarios/"+@user.to_param
  end

  def unfollow
    @user = User.find(params[:id])
    current_user.stop_following(@user)
    redirect_to "/usuarios/"+@user.to_param
  end

  def followers
    @user = User.find(params[:id])
  end

  def following
    @user = User.find(params[:id])
  end

  def index
    @following_ids = []
    @following_ids << current_user.id
    current_user.follows.each do |follow|
      @following_ids << follow.followable_id
    end

    @posts = Post.where(user_id: @following_ids).order("created_at DESC")
  end
end
