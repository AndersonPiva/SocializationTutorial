class UsersController < ApplicationController
  before_action :authenticate_user!

  def profile
    @user = User.find(params[:id])
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
end
