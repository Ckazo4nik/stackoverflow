class Comment < ApplicationRecord
  belongs_to :commentable , optional: true

  validates :body, presence: true
end
