class UsersController < ApplicationController

  def my_portfolio
    @user = current_user
    @user_stocks = current_user.stocks
  end
  def my_friends
    @friendships = current_user.friends
  end

  def search
    if params[:search_param].blank?
      flash.now[:danger] = "You have entered an empty search string"
    else
      @user = User.find_by email: params[:search_param]
      flash.now[:danger] = "No users match this search criteria" if @user.blank?
    end
    respond_to do |format|
      format.js { render partial: 'friends/result' }
    end
  end

  def add_friend
    @friend = User.find(params[:friend])
    @friendship = current_user.friendships.build(friend_id: @friend.id)
    if @friendship.save
      flash[:success] = "Friend was successfully addded"
    else
      flash[:danger]  =  "Something goes wrong"
    end
    redirect_to my_friends_path
  end
  def show
    @user = User.find(params[:id])
    @user_stocks = @user.stocks
  end
  private



end
