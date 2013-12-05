class HomeController < ApplicationController
  def index
      @wish_lists = WishList.all
      @items = Item.all
      @requests = Request.all
      @valid_users = ValidAccess.all
  end
=begin      if !current_user
      @wish_lists = WishList.where("privacy = ?", false)
      id_array = Array.new
      @wish_lists.each do |object|
        id_array.insert(-1, object.id)
      end
      @items = Item.where("wish_list_id IN (?)", id_array)
    elsif current_user
      @wish_lists = WishList.where("privacy = ? OR  id IN (?)", false, @valid_users)
      @wish_lists.each do |object|
        id_array.insert(-1, object.id)
      end
      @items = Item.where("wish_list_id IN (?)", id_array)
    end
=end

end
