class WishList < ActiveRecord::Base

has_many :items, :dependent => :destroy
has_many :valid_accesses
belongs_to :user

validates :name, presence: true
# validates :privacy, presence: true

end
