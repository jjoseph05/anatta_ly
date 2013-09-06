class ItemsController < ApplicationController
  def index
    # This should be all items of FRIENDS
    @items = Item.all
  end

  def new
    # Make sure to add some logic to ensure a user is signed in
    @item = Item.new
  end

  def create
    # User should be @user after oauth stuff is all setup (@user = current_user)
    @user = User.find_by_id(1)
    @item = Item.new(params[:item])
    @item.user_id = @user.id
    @item.save

    redirect_to user_item_url(@item)
  end

  def show
    @item = Item.find_by_id(params[:id])
  end

  def edit
    @item = Item.find_by_id(params[:id])
  end

  def update
    @item = Item.find_by_id(params[:id])
    @item.update_attributes(params[:item])
    redirect_to item_url(@item)
    # on failure, render :edit
  end

  def destroy
    # Make sure redirects to correct user
    @item = Item.find_by_id(params[:id])
    @item.destroy
    redirect_to user_path(1)
  end
end
