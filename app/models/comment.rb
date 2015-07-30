class Comment < ActiveRecord::Base
  belongs_to :item
  belongs_to :author, class_name: 'User'

  validates :body, presence: true, length: { minimum: 10 }
end
