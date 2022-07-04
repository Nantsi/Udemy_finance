class UsersController < ApplicationController
 
  def my_portfolio
    @user = current_user
    @tracked_stocks = current_user.stocks
  end
  
  def friends
    @cfriends = current_user.friends
  end
  
  def show
    @user = User.find(params[:id])
    @tracked_stocks = @user.stocks
  end
  
  def search
    if params[:friend].present?
      @friends = User.search(params[:friend])
      @friend = params[:friend]
      @cfriends = current_user.friends
      if @friends
          render 'users/friends'
      else
          flash[:alert] = "Couldn't find user"
          redirect_to friends_path
      end
    else
        flash[:alert] = "Please enter a search"
        redirect_to friends_path
    end
  end
    
end
