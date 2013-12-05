class Request < ActiveRecord::Base

belongs_to :user

validates :wish_list_id, presence: true
validates :user_id, presence: true
validates :user_from_id, presence: true
validates :status, presence: true

before_save :matching
validate :matching

  def matching
    list = WishList.where("id = ?", wish_list_id)
    if (list.user_id != user_id)
      errors.add :non_matching, "The wish list and user you chose aren't matching, please pick two that belong to each other"
    end
  end

end
