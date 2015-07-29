class Item < ActiveRecord::Base
  has_many :comments
  validates :name, presence: true
  validates :quantity, presence: true
end
