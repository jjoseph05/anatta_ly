class WelcomeController < ApplicationController
	def index
    if current_user
    	unless params[:search]
      	@items = Friend.items_of_friends(current_user)
      	@items.shuffle!
      else
      	friend_items = Item.items_of_friends(current_user)
      	@items = friend_items.search(params[:search])
      end
  	end
  end
end
