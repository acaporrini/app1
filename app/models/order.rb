class Order < ActiveRecord::Base
  has_and_belongs_to_many :products
  belongs_to :user
  scope :by_user, -> (user_id){ where("user_id=?", user_id) }
end