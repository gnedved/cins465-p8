class ValidAccess < ActiveRecord::Base

belongs_to :wish_list

validates :wish_list_id, presence: true
validates :user_id, presence: true

end
