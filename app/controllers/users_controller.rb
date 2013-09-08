class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find_by_id(params[:id])
    @items = @user.items
    graph = Koala::Facebook::API.new(@user.oauth_token)
    @profile_picture = graph.get_picture(@user.facebook_id)
  end
end
