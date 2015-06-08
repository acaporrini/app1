class Order < ActiveRecord::Base
  belongs_to :product
  belongs_to :user
  scope :full, -> { includes(:product , :user ) }
end