class Product < ActiveRecord::Base
  has_many :orders
  has_many :comments
  scope :search, -> (search_term){ where("lower(name) LIKE ? OR lower(description) LIKE ?", "%#{search_term.downcase}%", "%#{search_term.downcase}%") }

  validates :name, presence: true
  def average_rating
    comments.average(:rating).to_f
  end
end
