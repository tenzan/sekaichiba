class Item < ActiveRecord::Base
  has_many :comments, dependent: :delete_all
  validates :name, presence: true
  validates :quantity, presence: true
end
